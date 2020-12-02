import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/cupertino.dart';


class SleepData{
  final String day;
  final int hours;
  final charts.Color barColor;

  SleepData({
   @required this.day,
   @required this.hours,
   @required this.barColor
});

}