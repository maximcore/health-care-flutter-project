import 'package:charts_flutter/flutter.dart';
import 'package:health_and_care/screens_data/sleep_data/sleep.dart';
import 'package:health_and_care/screens_data/sleep_data/sleep_list.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';
import 'package:health_and_care/screens_data/activity_data/activity_list.dart';

class DatabaseSleepManager {
  static Database _db;


  static bool get isInit {
      return _db != null;
  }


  static Future<void> initDB() async {
    if (isInit) {
      return;
    }

    String dir = await getDatabasesPath();
    String path = dir + '/sleep.db';
    _db = await openDatabase(path, version: 1, onOpen: (db) {
    }, onCreate: (Database db, int version) async {
      await db.execute("""CREATE TABLE IF NOT EXISTS sleep (
          id INT AUTO_INCREMENT PRIMARY KEY,
          day STRING,
          duration STRING,
          isChanged BOOLEAN
          )""");
    });
  }

  static void insert(Sleep sleep) {
    _db.execute("""INSERT INTO sleep (day, duration, isChanged) VALUES (
       \"${sleep.day}\", \"${sleep.duration}\", \"${sleep.isChanged}\")""");
  }

  static Future<void> update(String day, String newDuration, String newStatus) async {
    await _db.update(
      "sleep",
      {columnDuration: newDuration,
      columnIsChanged: newStatus,
      },
      where: 'day = ?',
      whereArgs: [day],
    );
  }


  static Future<List<Sleep>> downloadAll() async {
    if(SleepList.size == 0 && ((await _db.rawQuery("SELECT * FROM sleep")).map((e) => Sleep.fromJson(e)).toList()).isEmpty){
      SleepList.addSleep(Sleep('Monday','0','false', ColorUtil.fromDartColor(Colors.red)));
      SleepList.addSleep(Sleep('Tuesday','0','false', ColorUtil.fromDartColor(Colors.red)));
      SleepList.addSleep(Sleep('Wednesday','0','false', ColorUtil.fromDartColor(Colors.red)));
      SleepList.addSleep(Sleep('Thursday','0','false', ColorUtil.fromDartColor(Colors.red)));
      SleepList.addSleep(Sleep('Friday','0','false', ColorUtil.fromDartColor(Colors.red)));
      SleepList.addSleep(Sleep('Saturday','0','false', ColorUtil.fromDartColor(Colors.red)));
      SleepList.addSleep(Sleep('Sunday','0','false', ColorUtil.fromDartColor(Colors.red)));

      for(int i = 0;i<SleepList.size;i++){
        DatabaseSleepManager.insert(SleepList.sleepList[i]);
      }
    }
    return (await _db.rawQuery("SELECT * FROM sleep")).map((e) => Sleep.fromJson(e)).toList();
  }
}