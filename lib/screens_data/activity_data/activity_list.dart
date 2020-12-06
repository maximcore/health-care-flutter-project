import 'package:health_and_care/screens_data/activity_data/activity.dart';

import 'package:flutter/material.dart';
import 'package:health_and_care/screens_data/activity_data/activity_database.dart';

class ActivityList{
 static List<Activity> _activityList = new List();

 static Future<void> remove(Activity activity){
   DatabaseManager.remove(activity.id);
   _activityList.remove(activity);
 }

 static Future<void> initList() async {
   await updateList();
 }

 static void addActivity(Activity activity) {
   DatabaseManager.insert(activity);
   _activityList.add(activity);
 }

 static Future<void> updateList() async {
   _activityList = await DatabaseManager.downloadAll();
 }

 Activity operator[](int index) {
   return activityList[index];
 }

 static int get size {
   return _activityList.length;
 }

 static List<Activity> get activityList => _activityList;


}