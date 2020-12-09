import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_and_care/screens_data/sleep_data/sleep.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:health_and_care/screens_data/sleep_data/sleep.dart';
import 'package:health_and_care/screens_data/sleep_data/sleep_list.dart';
import 'package:health_and_care/ui/sleep_screen.dart';

class SleepChart extends StatefulWidget {

  final List<Sleep> data;

  SleepChart({this.data});

  @override
  _SleepChartState createState() => _SleepChartState();
}

class _SleepChartState extends State<SleepChart> {
  @override
  Widget build(BuildContext context) {
    print('Building SleepChart');
    List<charts.Series<Sleep, String>> series = [
      charts.Series(
        id: "Hours",
        data: widget.data,
        domainFn: (Sleep series, _) =>
        series.day.substring(0,3),
        measureFn: (Sleep series, _) =>
            double.tryParse(series.duration),
        colorFn: (Sleep series, _) =>
        SleepList.setColor((series.duration)),
        //series,
      )
    ];
    return Container(
      height: 300,
      padding: EdgeInsets.all(16),
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
