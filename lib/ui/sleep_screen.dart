import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:health_and_care/screens_data/sleep_data/sleep.dart';
import 'package:health_and_care/screens_data/sleep_data/sleep_database.dart';
import 'package:health_and_care/screens_data/sleep_data/sleep_list.dart';

import '../screens_data/sleep_data/sleep_chart.dart';
import 'package:intl/intl.dart';

class SleepPage extends StatefulWidget {
  static Route<dynamic> route() => MaterialPageRoute(
        builder: (context) => SleepPage(),
      );

  @override
  SleepPageState createState() => SleepPageState();
}

class SleepPageState extends State<SleepPage> {
  SleepList sleepList = SleepList();

  static List<charts.Color> chartColors = [
    charts.ColorUtil.fromDartColor(Colors.red),
    charts.ColorUtil.fromDartColor(Colors.orange),
    charts.ColorUtil.fromDartColor(Colors.yellow),
    charts.ColorUtil.fromDartColor(Colors.blue),
    charts.ColorUtil.fromDartColor(Colors.greenAccent),
    charts.ColorUtil.fromDartColor(Colors.greenAccent),
    charts.ColorUtil.fromDartColor(Colors.greenAccent),
  ];

 static List<String> modified_days = [];


  static double averageTime() {
    int res = 0;
    int counter = 0;
    for (int i = 0; i < SleepList.sleepList.length; i++) {
      if (SleepList.sleepList[i].isChanged == 'true') {
          res += int.tryParse(SleepList.sleepList[i].duration);
          counter++;
      }
    }
    return counter == 0 ? 0 : res / counter;//modified_days.length;
  }

  String _currentItemSelected = DateFormat('EEEE').format(DateTime.now());

  static String day = DateFormat('EEEE').format(DateTime.now());
  static String duration;

  @override
  void initState() {
    super.initState();
  }

  static getSleepDuration() {
    return duration;
  }

  static getSleepDay() {
    return day;
  }



  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildDuration() {
    var input_controller = TextEditingController();
    return TextFormField(
      controller: input_controller,
      decoration: InputDecoration(
        hintText: 'Enter sleep duration in minutes',
        labelText: 'Duration',
        contentPadding: EdgeInsets.only(left: 20, right: 20),
        suffixIcon: IconButton(
          onPressed: () => input_controller.clear(),
          icon: Icon(Icons.clear),
        ),
      ),
      validator: (String value) {
        int duration = int.tryParse(value);

        if (duration == null || duration < 0) {
          return 'Duration must be greater than 0 min';
        }
        return null;
      },
      onSaved: (String value) {
        duration = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Today is ${DateFormat('EEEE').format(DateTime.now())}"),
        backgroundColor: Colors.deepPurpleAccent,
        centerTitle: true,
      ),
      body: Center(
          child: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                child: SleepChart(data: SleepList.sleepList),
                //child: SleepChart(data: SleepList.sleepList),
              ),
              Container(
                child: Text(
                    'average time of sleep is ${averageTime().toStringAsFixed(1)} hours'),
              ),
              Form(
                key: _formKey,
                child: _buildDuration(),
              ),
              new DropdownButton<String>(
                items: <String>[
                  'Monday',
                  'Tuesday',
                  'Wednesday',
                  'Thursday',
                  'Friday',
                  'Saturday',
                  'Sunday'
                ].map((String value) {
                  return new DropdownMenuItem<String>(
                    value: value,
                    child: new Text(value),
                  );
                }).toList(),
                onChanged: (String newValueSelected) {
                  setState(() {
                    _currentItemSelected = newValueSelected;
                    day = _currentItemSelected;
                  });
                  onSaved:
                  (String value) {
                    duration = value;
                  };
                },
                value: _currentItemSelected,
              ),
              RaisedButton(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  'Add Sleep Information',
                  style: TextStyle(color: Colors.purple, fontSize: 16),
                ),
                onPressed: () {
                  if (!_formKey.currentState.validate())
                    return;
                  else {
                    _formKey.currentState.save();
                    setState(() {
                      for (int i = 0; i < SleepList.sleepList.length; i++) {
                        if (SleepList.sleepList[i].day == day) {
                          SleepList.sleepList[i] = new Sleep(day, duration,'true', SleepList.setColor(duration));
                          DatabaseSleepManager.update(day, duration,'true');
                          if(!modified_days.contains(day)){
                            modified_days.add(day);
                          }
                        }
                      }
                    });
                  }
                  //ActivityDatabaseProvider().
                },
              ),
            ],
          ),
        ),
      )),
    );
  }
}
