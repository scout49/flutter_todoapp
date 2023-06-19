import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../common/common_DateTime.dart';
import '../provider.dart';

class VisibleWidget extends StatelessWidget{
  //VisibleWidget({});

  @override
  Widget build(BuildContext context){
    return Visibility(child: Container());
  }
}

class DateText extends StatelessWidget{
  DateText({required this.time});

  final DateTime time;
  final DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context){


    return Column(
      children: <Widget>[
        if(now.year == time.year) Text(DateFormat('MM/dd').format(time)),
        if(now.year != time.year) Text(DateFormat('yyyy/MM/dd').format(time))
      ],
    );
  }
}

class DateTimeText extends StatelessWidget{
  DateTimeText({required this.time});

  final DateTime time;
  final DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context){


    return Column(
      children: <Widget>[
        if(now.year == time.year) Text(DateFormat('MM/dd HH:mm').format(time)),
        if(now.year != time.year) Text(DateFormat('yyyy/MM-dd HH:mm').format(time))
      ],
    );
  }
}

class RemainingTimeText extends HookConsumerWidget{
  RemainingTimeText({required this.time});

  final DateTime time;

  @override
  Widget build(BuildContext context, WidgetRef ref){
    final clock = ref.watch(clockProvider);

    return Text('${getRemainingTime(time)}');
  }
}
