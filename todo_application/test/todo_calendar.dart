import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_application/provider.dart';
import 'package:todo_application/value/todo_viewdata.dart';


final calendarProvider = StateNotifierProvider<CalendarNotifier, DateTime>((ref) {
  return CalendarNotifier();
});

class CalendarNotifier extends StateNotifier<DateTime> {
  CalendarNotifier() : super(DateTime.now());

  void moveToPreviousMonth() {
    state = DateTime(state.year, state.month - 1);
  }

  void moveToNextMonth() {
    state = DateTime(state.year, state.month + 1);
  }
}

class CalendarScreen extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentYearMonth = ref.watch(calendarProvider);
    final currentMonthDates = _generateMonthDates(currentYearMonth);

    void moveToPreviousMonth() {
      ref.read(calendarProvider.notifier).moveToPreviousMonth();
    }

    void moveToNextMonth() {
      ref.read(calendarProvider.notifier).moveToNextMonth();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: moveToPreviousMonth,
                ),
                Text(
                  '${currentYearMonth.year}/${currentYearMonth.month}',
                  style: TextStyle(fontSize: 20.0),
                ),
                IconButton(
                  icon: Icon(Icons.arrow_forward),
                  onPressed: moveToNextMonth,
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 7,
              children: List.generate(currentMonthDates.length, (index) {
                final date = currentMonthDates[index];
                return GestureDetector(
                  onTap: () {
                    print(date);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Center(
                      child: Text(date.day.toString()),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  static List<DateTime> _generateMonthDates(DateTime yearMonth) {
    final firstDay = DateTime(yearMonth.year, yearMonth.month, 1);
    final lastDay = DateTime(yearMonth.year, yearMonth.month + 1, 0);
    return List<DateTime>.generate(
      lastDay.day,
      (index) => DateTime(yearMonth.year, yearMonth.month, index + 1),
    );
  }
}