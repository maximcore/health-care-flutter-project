import 'package:health_and_care/sleep_data/sleep.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';
import 'file:///C:/Users/maxim/AndroidStudioProjects/health_and_care/lib/activity_data/activity.dart';
import 'package:health_and_care/activity_data/activity_list.dart';

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
          duration STRING
          )""");
    });
  }

  static void insert(Sleep sleep) {
    _db.execute("""INSERT INTO sleep (day, duration) VALUES (
        \"${sleep.day}\", \"${sleep.duration}\")""");
  }

  static Future<List<Sleep>> downloadAll() async {
    return (await _db.rawQuery("SELECT * FROM sleep")).map((e) => Sleep.fromJson(e)).toList();
  }
}