import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_application/provider.dart';
import 'package:todo_application/value/todo_viewdata.dart';

class TodoScheduleView extends HookConsumerWidget {
  const TodoScheduleView({
    Key? key,
    required this.todos,
  }) : super(key: key);

  final List<TodoViewData> todos;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Container(
        child: SfCalendar(
          view: CalendarView.schedule,
          onTap: (calendarTapDetails) {
            ref.watch(selectedDateProvider.notifier).selectDate(calendarTapDetails.date!);
          },
          dataSource: TodoSource(todos),
          scheduleViewSettings: const ScheduleViewSettings(
            appointmentTextStyle: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
            weekHeaderSettings: WeekHeaderSettings(),
            hideEmptyScheduleWeek: true,
          ),
        ),
      ),
    );
  }
}

class TodoCalendarView extends HookConsumerWidget {
  const TodoCalendarView({
    Key? key,
    required this.todos,
    required this.selectdate,
  }) : super(key: key);

  final List<TodoViewData> todos;
  final DateTime selectdate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final selectDate = ref.watch(selectedDateProvider).selecteddate;
    final today = DateTime(selectdate.year, selectdate.month, selectdate.day);

    return Scaffold(
      body: Container(
        child: SfCalendar(
          view: CalendarView.month,
          showDatePickerButton: true,
          initialSelectedDate: today,
          onTap: (calendarTapDetails) {
            ref.watch(selectedDateProvider.notifier).selectDate(calendarTapDetails.date!);
          },
          dataSource: TodoSource(todos),
          monthViewSettings: const MonthViewSettings(
            showAgenda: true,
            //appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
            //appointmentDisplayCount: 3,
            agendaStyle: AgendaStyle(
              appointmentTextStyle: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w200,
                color: Colors.black,
              ),
            ),
            navigationDirection: MonthNavigationDirection.vertical
          ),
        ),
      ),
    );
  }
}

class TodoSource extends CalendarDataSource {
  TodoSource(List<TodoViewData> todos) {
    appointments = todos;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].date;
  }

  @override
  bool isAllDay(int index) {
    return true;
  }

  @override
  Color getColor(int index) {
    return Colors.white10;
  }

  @override
  String getSubject(int index) {
    return appointments![index].text;
  }
}
