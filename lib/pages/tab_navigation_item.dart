import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_and_care/ui/activity_screen.dart';
import 'package:health_and_care/ui/weight_screen.dart';
import 'package:health_and_care/ui/food_screen.dart';
import 'package:health_and_care/ui/sleep_screen.dart';


class TabNavigationItem {
  final Widget page;
  final Widget title;
  final Icon icon;
  TabNavigationItem({
    @required this.page, @ required this.title, @required this.icon,});

  static List<TabNavigationItem> get items => [
    TabNavigationItem(
      page: FoodPage(),
      icon: Icon(Icons.fastfood_rounded),
      title: Text('Food'),
    ),
    TabNavigationItem(
        page: SleepPage(),
        icon: Icon(Icons.bedtime),
        title: Text('Sleep')
    ),
    TabNavigationItem(
        page: ActivityPage(),
        icon: Icon(Icons.directions_run),
        title: Text('Activity')
    ),
    TabNavigationItem(
        page: WeightPage(),
        icon: Icon(Icons.airplay),
        title: Text('Weight')
    ),
  ];

}