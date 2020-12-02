import 'dart:async';

import 'package:path/path.dart';

import 'package:sqflite/sqflite.dart';

final String tableActivityList ='activity';
final String columnActivity ='activity';
final String columnDuration ='duration';
final String columnCalories ='calories';

class Activity {
   String activity;
   String duration;
    //int calories;
   String calories;

    @override
    String toString(){
      return '$activity $duration $calories';
    }

  Activity(this.activity, this.duration) {
    calories = initCalories();
  }

  Map<String, dynamic> toMap(){
    return <String, dynamic>{
      columnActivity: activity,
      columnDuration: duration,
      columnCalories: calories
    };
  }

  Activity.fromMap(Map<String, dynamic> map){
    activity = map[columnActivity];
    duration = map[columnDuration];
    calories = map[columnCalories];
  }

   Activity.fromJson(Map<String, dynamic> json)
       : activity = json["activity"],
         duration = (json["duration"]).toString(),
         //calories = int.parse(json["calories"]);
          calories = json["calories"].toString();

   initCalories(){
     if (activity == 'Running') {
       //return calories = 5 * int.parse(duration);
       return calories = (5*int.parse(duration)).toString();
     } else if (activity == 'Walking') {
       //return calories = 2 * int.parse(duration);
       return calories = (2*int.parse(duration)).toString();

     } else if (activity == 'Gym') {
      // return calories = 7 * int.parse(duration);
       return calories = (7*int.parse(duration)).toString();

     }
     else if (activity == 'Dance') {
      // return calories = 4 * int.parse(duration);
       return calories = (4*int.parse(duration)).toString();

     }
     else if (activity == 'Football') {
       //return calories = 6 * int.parse(duration);
       return calories = (6*int.parse(duration)).toString();

     }
   }

}