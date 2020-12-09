import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:health_and_care/screens_data/sleep_data/sleep_database.dart';
import 'package:health_and_care/screens_data/sleep_data/sleep.dart';
import 'package:intl/intl.dart';

class SleepList{

  static List<String> dayList = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];

  static List<Sleep> _sleepList = new List();


  static Future<void> initList() async {
    print('Init SleepList');
    await updateList();
  }

  static void addSleep(Sleep sleep) {
    print('Adding sleep to SleepList');
    if(SleepList.size < 7) {
      DatabaseSleepManager.insert(sleep);
    }
    if(_sleepList == 0) {
      _sleepList.add(sleep);
    }
  }

  static void printList(){
    print('Print SleepList');
    for(int i = 0;i<sleepList.length;i++){
      print('${sleepList[i].day} ${sleepList[i].duration} ${sleepList[i].isChanged}');
    }
  }



  static Future<void> updateList() async {
    print('Updating SleepList');
    String currentTime = DateFormat('EEEE').format(DateTime.now());
    if(_sleepList.length == 0) {
      _sleepList = await DatabaseSleepManager.downloadAll();
    }
  }

  static Color setColor(String duration){
    print('Setting color');
    if(int.tryParse(duration) < 3){
      return ColorUtil.fromDartColor(Colors.red);
    }
    else if(int.tryParse(duration) <= 5 && int.tryParse(duration) > 3){
      return ColorUtil.fromDartColor(Colors.orange);
    }
    else if(int.tryParse(duration) > 5 && int.tryParse(duration) < 7){
      return ColorUtil.fromDartColor(Colors.yellow);
    }
    else if(int.tryParse(duration) >= 7 && int.tryParse(duration) <9 ){
      return ColorUtil.fromDartColor(Colors.lightBlueAccent);
    }
    else if(int.tryParse(duration) >= 9 ){
      return ColorUtil.fromDartColor(Colors.greenAccent);
    }
  }

  Sleep operator[](int index) {
    return _sleepList[index];
  }



  static int get size {
    return _sleepList.length;
  }

  static List<Sleep> get sleepList => _sleepList;

}