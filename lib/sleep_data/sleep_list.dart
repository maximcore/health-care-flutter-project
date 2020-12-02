import 'package:flutter/material.dart';
import 'package:health_and_care/sleep_data/sleep_database.dart';
import 'package:health_and_care/sleep_data/sleep.dart';


class SleepList{
  static List<Sleep> _sleepList = new List();

  static Future<void> initList() async {
    await updateList();
  }

  static void addSleep(Sleep sleep) {
    DatabaseSleepManager.insert(sleep);
    _sleepList.add(sleep);
  }

  static Future<void> updateList() async {
    _sleepList = await DatabaseSleepManager.downloadAll();
  }

  Sleep operator[](int index) {
    return sleepList[index];
  }

  static int get size {
    return _sleepList.length;
  }

  static List<Sleep> get sleepList => _sleepList;


}