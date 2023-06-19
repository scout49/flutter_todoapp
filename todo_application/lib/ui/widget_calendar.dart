import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_application/provider.dart';
import '../common/common_DateTime.dart';


class CalendarTile extends HookConsumerWidget {
  const CalendarTile({
    required this.date,
  });

  final DateTime date;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final screenSize = MediaQuery.of(context).size;

    return GridTile(
          child: Container(
            //alignment: Alignment.center,
            //height: cellSize,
            decoration: BoxDecoration(
              border: ref.watch(selectedDateProvider).selecteddate == date
                  ? Border.all(color: Theme.of(context).primaryColor)
                  : Border.all(color: Colors.transparent),
            ),
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSameDate(DateTime.now(), date)
                      ? Theme.of(context).primaryColor
                      : Colors.transparent,
                ),
                child: Text(
                  date.day.toString(),
                  style: TextStyle(
                    color: isSameDate(DateTime.now(), date)
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
              ),
            ),
          ),
        );
  }
}

class CalendarWidget extends HookConsumerWidget {
  CalendarWidget({
    required this.currentYearMonth,
  });

  final DateTime currentYearMonth;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentMonthDates = _generateMonthDates(currentYearMonth);
    final weekdays = ['日', '月', '火', '水', '木', '金', '土'];
    final screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final cellHeight = constraints.maxHeight / 7;
          final cellWidth = constraints.maxWidth/7;
          //print('$cellHeight');

          return GridView.count(
            crossAxisCount: 7,
            childAspectRatio: (cellWidth/cellHeight),
            shrinkWrap: true,
            children: [
              for (var weekday in weekdays)
                Container(
                  alignment: Alignment.center,
                  //height: cellHeight,
                  decoration: BoxDecoration(
                    //border: Border.all(color: Colors.grey),
                  ),
                  child: Center(
                    child: Text(
                      weekday,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ...List.generate(currentMonthDates.length, (index) {
                final date = currentMonthDates[index];
                return GestureDetector(
                  onTap: () {
                    print(date);
                    ref
                        .watch(selectedDateProvider.notifier)
                        .selectDate(date);
                  },
                  child: CalendarTile(date: date),
                );
              }),
            ],
          );
        },
      ),
    );
  }

  static List<DateTime> _generateMonthDates(DateTime yearMonth) {
    final firstDay = DateTime(yearMonth.year, yearMonth.month, 1);
    final lastDay = DateTime(yearMonth.year, yearMonth.month + 1, 0);
    final startWeekday = (firstDay.weekday) % 7; // 1を日曜日とするために調整
    return List<DateTime>.generate(
      lastDay.day + startWeekday,
      (index) => index < startWeekday
          ? DateTime(
              yearMonth.year,
              yearMonth.month - 1,
              _getDaysInMonth(yearMonth.year, yearMonth.month - 1) -
                  (startWeekday - index) +
                  1,
            )
          : DateTime(yearMonth.year, yearMonth.month, index - startWeekday + 1),
    );
  }

  static int _getDaysInMonth(int year, int month) {
    if (month == 2) {
      if ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0) {
        return 29; // 閏年の場合
      } else {
        return 28; // 閏年でない場合
      }
    } else if ([4, 6, 9, 11].contains(month)) {
      return 30;
    } else {
      return 31;
    }
  }
}
