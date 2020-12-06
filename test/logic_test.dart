import 'package:flutter/material.dart';
import 'package:health_and_care/screens_data/activity_data/activity.dart';
import 'package:health_and_care/screens_data/activity_data/activity_list.dart';
import 'package:health_and_care/screens_data/sleep_data/sleep_list.dart';
import 'package:health_and_care/ui/activity_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:health_and_care/ui/dog_screen.dart';
import 'dart:ui';
import 'package:health_and_care/ui/sleep_screen.dart';



void main(){
  test('Remove all items from list, expect list size = 0', () async {

    ActivityList.activityList.clear();

    expect(ActivityList.size,0);

  });

  test('Add item to empty activityList, expect list size = 1', () async {

    ActivityList.activityList.add(new Activity('${new DateTime.now()}','Walking','4'));

    expect(ActivityList.size,1);

  });

  test('Calculate lost calories after Football activity', () async{

   final new_activity = Activity('this is id', 'Football', '90');

   expect(int.tryParse(new_activity.initCalories()), 6*90);

  });


  test('Set color of chart bar when sleep duration is less than 3 hours, expect red color', () async {

    expect(
        [Colors.red.red, Colors.red.green, Colors.red.blue],
         [SleepList.setColor('2').r, SleepList.setColor('2').g, SleepList.setColor('2').b]
    );

  });

  test('Set color of chart bar when sleep duration is more than 9 hours, expect greenAccent color', () async {

    expect(
        [Colors.greenAccent.red, Colors.greenAccent.green, Colors.greenAccent.blue],
        [SleepList.setColor('11').r, SleepList.setColor('11').g, SleepList.setColor('11').b]
    );
  });


}