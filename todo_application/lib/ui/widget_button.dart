import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';

class DatePickerButton extends StatelessWidget{
  const DatePickerButton({
    required this.date,
    required this.onDateSelected,
  });

  final DateTime date;
  final Function(DateTime pickedDate) onDateSelected;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        final DateTime? pickedDate =await showDatePicker(
          context: context, 
          initialDate: date, 
          firstDate: DateTime(date.year), 
          lastDate: DateTime(date.year + 1)
          );

        if(pickedDate != null){
          onDateSelected(pickedDate);
        }

      }, 
      icon: const Icon(Icons.calendar_month)
      );

  }
}

class TimePickerButton extends StatelessWidget{
  const TimePickerButton({
    required this.time,
    required this.onTimeSelected,
  });

  final DateTime time;
  final Function(DateTime pickedTime) onTimeSelected;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        final TimeOfDay? selectTime =await showTimePicker(
          context: context, 
          initialTime: TimeOfDay.fromDateTime(time), 

          );

        if(selectTime != null){
          final pickedTime = DateTime(time.year,time.month,time.day,selectTime.hour,selectTime.minute);
          onTimeSelected(pickedTime);
        }

      }, 
      icon: const Icon(Icons.watch)
      );

  }

}

class DateTimePickerButton extends StatelessWidget{
  const DateTimePickerButton({
    required this.alarm,
    required this.onDateTimeSelected,
  });

  final DateTime alarm;
  final Function(DateTime pickedDateTime) onDateTimeSelected;

  @override
  Widget build(BuildContext context){
    return ElevatedButton(
      onPressed: (){
        DatePicker.showDateTimePicker(context,
          showTitleActions: true,
          minTime: DateTime.now(),
          onChanged: (date){
            //alarmTime = date;
          },
          onConfirm: (date){
            onDateTimeSelected(date);
          },
          currentTime: alarm,locale: LocaleType.jp,
          );
      }, 
                      child: const Icon(Icons.alarm_rounded)
    );
  }
}

class SwitchButton extends HookConsumerWidget{
  const SwitchButton({
    required this.onOff,
    required this.onSwitched,
  });

  final Function() onSwitched;
  final bool onOff;
  @override
  Widget build(BuildContext context, WidgetRef ref){
    final toggle = useState(onOff);

    return Switch(value: toggle.value, onChanged: (value){
      toggle.value = value;
      onSwitched();
    });
    
  }
}


class ExpansionTileButton extends HookConsumerWidget{
  const ExpansionTileButton({
    required this.title,
    required this.widget,
    
  });

  final Text title;
  final HookConsumerWidget widget;

  @override
  Widget build(BuildContext context, WidgetRef ref){
      return ExpansionTile(title: title,
        children: <HookConsumerWidget> [widget],
      );
  }
}

