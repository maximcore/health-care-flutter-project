import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';
import 'package:health_and_care/screens_data/activity_data/activity.dart';
import 'package:health_and_care/screens_data/activity_data/activity_list.dart';

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
          ${columnId} STRING PRIMARY KEY,
          ${columnActivity} STRING,
          ${columnDuration} STRING,
          ${columnCalories} STRING
          )""");
    });
  }

  static void insert(Activity activity) {
    _db.execute("""INSERT INTO activity (${columnId}, ${columnActivity}, ${columnDuration}, ${columnCalories}) VALUES (
        \"${activity.id}\", \"${activity.activity}\", 
        \"${activity.duration}\", \"${activity.calories}\")""");
  }

  static void remove(String id) {
    _db.delete('activity',
      where: '$columnId = ?',
      whereArgs: ['${id}'],
    );
  }

  static Future<List<Activity>> downloadAll() async {
    return (await _db.rawQuery("SELECT * FROM activity")).map((e) => Activity.fromJson(e)).toList();
  }
}