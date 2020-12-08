import 'dart:async';

import 'package:path/path.dart';

import 'package:sqflite/sqflite.dart';
import 'package:charts_flutter/flutter.dart' as charts;

final String tableSleepList = 'sleep';
final String columnDay = 'day';
final String columnDuration = 'duration';
final String columnIsChanged = 'isChanged';

class Sleep {
  String day;
  String duration;
  String isChanged;


  @override
  String toString() {
    return '$day $duration';
  }

  Sleep(this.day, this.duration, this.isChanged, barColor);


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      columnDay: day,
      columnDuration: duration,
      columnIsChanged: isChanged,
    };
  }

  Sleep.fromMap(Map<String, dynamic> map) {
    day = map[columnDay];
    duration = map[columnDuration];
    isChanged = map[columnIsChanged];
  }

  Sleep.fromJson(Map<String, dynamic> json)
      : day = json["day"],
        duration = (json["duration"]).toString(),
        isChanged = json["isChanged"];
}
