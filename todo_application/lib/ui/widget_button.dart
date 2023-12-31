import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class DatePickerButton extends StatelessWidget{
  const DatePickerButton({
    required this.date,
    required this.onDateSelected,
    this.year = false,
    this.label,
  });

  final DateTime date;
  final Function(DateTime pickedDate) onDateSelected;
  final bool year;
  final Widget? label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        IconButton(
        onPressed: () async {
          final DateTime? pickedDate =await showDatePicker(
            context: context, 
            initialDate: date, 
            initialDatePickerMode: year? DatePickerMode.year: DatePickerMode.day,
            firstDate: DateTime(date.year), 
            lastDate: DateTime(date.year + 1)
          );
          if(pickedDate != null){
            onDateSelected(pickedDate);
          }
        }, 
        icon: const Icon(Icons.edit_calendar)
      ),
      if(label != null)label!,
      ]
    );

  }
}

class TimePickerButton extends StatelessWidget{
  const TimePickerButton({
    required this.time,
    required this.onTimeSelected,
    this.label,
  });

  final DateTime time;
  final Function(DateTime pickedTime) onTimeSelected;
  final Widget? label;

  @override
  Widget build(BuildContext context) {

    return Column(children: <Widget>[
      IconButton(
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
      icon: const Icon(Icons.update)),
      if(label != null)label!,
    ]
    );
  }
}

class DateTimePickerButton extends StatelessWidget{
  const DateTimePickerButton({
    required this.alarm,
    required this.onDateTimeSelected,
    this.label,
  });

  final DateTime alarm;
  final Function(DateTime pickedDateTime) onDateTimeSelected;
  final Widget? label; 

  @override
  Widget build(BuildContext context){
    if(label != null){
      return ElevatedButton.icon(
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
        label: label!,
        icon: const Icon(Icons.alarm_add)
      );
    }else{
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
          child: const Icon(Icons.alarm_add)
      );
    }

  }
}

class ColorPickerButton extends StatelessWidget {
  const ColorPickerButton({
    required this.color,
    required this.onColorSelected,
  });

  final Color color;
  final Function(Color pickedColor) onColorSelected;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              child: MaterialPicker(
                pickerColor: color,
                onColorChanged: (value) {
                  Navigator.of(context).pop(); 
                  Future(() => onColorSelected(value));
                },
              ),
            );
          },
        );
      },
      child:  Icon(Icons.colorize, color: color == Colors.transparent? Colors.black : color),
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
