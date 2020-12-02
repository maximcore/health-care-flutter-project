import 'package:flutter/material.dart';
import 'file:///C:/Users/maxim/AndroidStudioProjects/health_and_care/lib/sleep/sleep_data.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:health_and_care/sleep_data/add_sleep_screen.dart';

import '../sleep/sleep_chart.dart';

class SleepPage extends StatelessWidget {

  final List<SleepData> data = [
    SleepData(
      day: 'Mnd',
      hours: 8,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
    SleepData(
      day: 'Tsd',
      hours: 9,
      barColor: charts.ColorUtil.fromDartColor(Colors.greenAccent),
    ),
    SleepData(
      day: 'Wnd',
      hours: 6,
      barColor: charts.ColorUtil.fromDartColor(Colors.orange),
    ),
    SleepData(
      day: 'Thd',
      hours: 4,
      barColor: charts.ColorUtil.fromDartColor(Colors.red),
    ),
    SleepData(
      day: 'Frd',
      hours: 9,
      barColor: charts.ColorUtil.fromDartColor(Colors.greenAccent),
    ),
    SleepData(
      day: 'Sat',
      hours: 8,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
    SleepData(
      day: 'Sun',
      hours: 11,
      barColor: charts.ColorUtil.fromDartColor(Colors.yellow),
    ),

  ];

  double averageTime(){
    int res = 0;
    for(SleepData item in data){
      res+= item.hours;
    }
    return res/7;
  }

  static Route<dynamic> route() => MaterialPageRoute(
        builder: (context) => SleepPage(),
      );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Sleep"),
          backgroundColor: Colors.deepPurpleAccent,
          centerTitle: true,
        ),
        body:
        Center(
          child: Container(
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[
                    Container(
                      child: SleepChart(data: data),
                    ),
                    Container(
                      child: Text('average time of sleep is ${averageTime().toStringAsFixed(1)} hours'),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 80.0),
                      child: ElevatedButton(
                        onPressed: ()
                        {
                          Navigator.push(context,
                          MaterialPageRoute(
                              builder: (context) => AddSleepPage()),
                        );
                        },
                        child:
                        Text('Add Sleep',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),),
                      ),
                    ),
                  ],
                ),
          )
        ),
    );
  }
}
