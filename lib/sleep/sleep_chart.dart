import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///C:/Users/maxim/AndroidStudioProjects/health_and_care/lib/sleep/sleep_data.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class SleepChart extends StatelessWidget {

  final List<SleepData> data;

  SleepChart({this.data});

  @override
  Widget build(BuildContext context) {

    List<charts.Series<SleepData, String>> series = [

      charts.Series(
        id: "Hours",
        data: data,
        domainFn: (SleepData series, _) =>
        series.day,
        measureFn: (SleepData series, _) =>
            series.hours,
        colorFn: (SleepData series, _) =>
        series.barColor,
      )

    ];

    return Container(
      height: 300,
      padding: EdgeInsets.all(20),
      child: Card(
        child: Column(
          children: <Widget>[
            Text('Sleep statistic',
            style: Theme.of(context).textTheme.bodyText2
            ),
            Expanded(
              child: charts.BarChart(
                series,
                animate: true,
              ),
            )
          ],
        )
      ),
    );
  }
}
