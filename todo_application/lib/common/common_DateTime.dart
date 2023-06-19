

bool isSameDate(DateTime date1,DateTime date2){
  final date11 = DateTime(date1.year,date1.month,date1.day);
  final date22 = DateTime(date2.year,date2.month,date2.day);

  return date11.isAtSameMomentAs(date22);
}

DateTime getDate(DateTime date){
  return DateTime(date.year,date.month,date.day);
}

DateTime getMinute(DateTime date){
  return DateTime(date.year,date.month,date.day,date.hour,date.minute);
}

String getRemainingTime(DateTime date){
  final difference = DateTime.now().difference(date).abs();

  if(difference.inDays > 1){
    return '${difference.inDays.toString()}日';
  }else if(difference.inHours>1){
    return '${difference.inHours.toString()}時間';
  }else if(difference.inMinutes>1){
    return '${difference.inMinutes.toString()}分';
  }else{
    return '${difference.inSeconds.toString()}秒';
  }
}