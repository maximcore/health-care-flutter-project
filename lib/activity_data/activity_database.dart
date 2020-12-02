import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';
import 'file:///C:/Users/maxim/AndroidStudioProjects/health_and_care/lib/activity_data/activity.dart';
import 'package:health_and_care/activity_data/activity_list.dart';

class DatabaseManager {
  static Database _db;

  static bool get isInit {
    return _db != null;
  }

  static Future<void> initDB() async {
    if (isInit) {
      return;
    }
    String dir = await getDatabasesPath();
    String path = dir + '/activity.db';
    _db = await openDatabase(path, version: 1, onOpen: (db) {
    }, onCreate: (Database db, int version) async {
      await db.execute("""CREATE TABLE IF NOT EXISTS activity (
          id INT AUTO_INCREMENT PRIMARY KEY,
          activity STRING,
          duration STRING,
          calories STRING
          )""");
    });
  }

  static void insert(Activity activity) {
    print(ActivityList.size);
    // _db.insert('Deals', note.toJson());
    _db.execute("""INSERT INTO activity (activity, duration, calories) VALUES (
        \"${activity.activity}\", \"${activity.duration}\",
        \"${activity.calories}\")""");
  }

  static Future<List<Activity>> downloadAll() async {
    return (await _db.rawQuery("SELECT * FROM activity")).map((e) => Activity.fromJson(e)).toList();
  }
}