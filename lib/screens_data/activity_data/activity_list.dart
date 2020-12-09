import 'package:health_and_care/screens_data/activity_data/activity.dart';

import 'package:flutter/material.dart';
import 'package:health_and_care/screens_data/activity_data/activity_database.dart';


import 'dart:developer' as developer;


class ActivityList{
 static List<Activity> _activityList = new List();

 static Future<void> remove(Activity activity){
   print('Remove activity from ActivityList & Database');
   DatabaseManager.remove(activity.id);
   _activityList.remove(activity);
 }

 static Future<void> initList() async {
   print('Updating ActivityList');
   await updateList();
 }

 static void addActivity(Activity activity) {
   print('Adiing activity to Database & ActivityList');
   DatabaseManager.insert(activity);
   _activityList.add(activity);
 }

 static Future<void> updateList() async {
   print('Updating ActivityList');
   _activityList = await DatabaseManager.downloadAll();
 }

 Activity operator[](int index) {
   return activityList[index];
 }

 static int get size {
   print('Getting size of ActivityList');
   return _activityList.length;
 }

 static List<Activity> get activityList => _activityList;


}