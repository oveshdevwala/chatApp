import 'package:flutter/material.dart';

String getFormatedTime(String? milliseconds, BuildContext context) {
  return milliseconds != null ?TimeOfDay.fromDateTime(
      DateTime.fromMillisecondsSinceEpoch(int.parse(milliseconds))).format(context).toString():'Not Readed';
}
