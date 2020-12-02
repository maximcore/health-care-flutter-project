import 'dart:async';

import 'package:path/path.dart';

import 'package:sqflite/sqflite.dart';

final String tableSleepList = 'sleep';
final String columnDay = 'day';
final String columnDuration = 'duration';

class Sleep {
  String day;
  String duration;

  @override
  String toString() {
    return '$day $duration';
  }

  Sleep(this.day, this.duration);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      columnDay: day,
      columnDuration: duration,
    };
  }

  Sleep.fromMap(Map<String, dynamic> map) {
    day = map[columnDay];
    duration = map[columnDuration];
  }

  Sleep.fromJson(Map<String, dynamic> json)
      : day = json["day"],
        duration = (json["duration"]).toString();
}
