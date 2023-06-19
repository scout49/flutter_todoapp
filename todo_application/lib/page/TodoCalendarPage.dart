import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_application/provider.dart';
import 'package:todo_application/ui/widget_calendar.dart';
import '../ui/widget_button.dart';


final calendarProvider = StateNotifierProvider<CalendarNotifier, DateTime>((ref) {
  return CalendarNotifier();
});

class CalendarNotifier extends StateNotifier<DateTime> {
  CalendarNotifier() : super(DateTime.now());

  void moveToPreviousMonth() {
    state = DateTime(state.year, state.month - 1);
    print('previous');
  }

  void moveToNextMonth() {
    state = DateTime(state.year, state.month + 1);
    print('next');
  }

  void setToMonth(DateTime? date){
    if(date != null){
      state = DateTime(date.year,date.month);
      print('calender:setToMonth${date.year}/${date.month}'); 
    }
  }
}

final pageControllerProvider = Provider<PageController>((ref) {
  return PageController(initialPage: 1, viewportFraction: 1.0);
},);

class CalendarScreen extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentYearMonth = ref.watch(calendarProvider);
    final pageController = ref.watch(pageControllerProvider);
    final previousYearMonth = DateTime(currentYearMonth.year, currentYearMonth.month - 1);
    final nextYearMonth = DateTime(currentYearMonth.year, currentYearMonth.month + 1);
    final screenSize = MediaQuery.of(context).size; 
    final bodyHeight = screenSize.height- AppBar().preferredSize.height;

    void moveToPreviousMonth() {
      ref.read(calendarProvider.notifier).moveToPreviousMonth();
      pageController.jumpToPage(1);
    }

    void moveToNextMonth() {
      ref.read(calendarProvider.notifier).moveToNextMonth();
      pageController.jumpToPage(1);
    }


    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar ${currentYearMonth.year}/${currentYearMonth.month}'),
        actions: <Widget>[DatePickerButton(
          date: ref.watch(selectedDateProvider).selecteddate, 
          onDateSelected: ((pickedDate) {
            ref.read(calendarProvider.notifier).setToMonth(pickedDate);
          }),
          year: true,
          )],
      ),
      body: SizedBox(
        //height: bodyHeight,
        child: PageView.builder(
        controller: pageController,
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        onPageChanged: (value) {
          if(value == 0){
            moveToPreviousMonth();
          }else if(value == 2){
            moveToNextMonth();
          }else{

          }
        },
        itemBuilder: (context, index) {
          final yearMonth = _getPageYearMonth(currentYearMonth, index);
          return CalendarWidget(currentYearMonth: yearMonth);
        },)
      ),
    );
  }

  DateTime _getPageYearMonth(DateTime currentYearMonth, int pageIndex) {
    if (pageIndex == 0) {
      return DateTime(currentYearMonth.year, currentYearMonth.month - 1);
    } else if (pageIndex == 2) {
      return DateTime(currentYearMonth.year, currentYearMonth.month + 1);
    } else {
      return currentYearMonth;
    }
  }
}