import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:charts_flutter/flutter.dart' as charts;
import 'file:///C:/Users/maxim/AndroidStudioProjects/health_and_care/lib/screens_data/activity_data/activity_list_page.dart';
import 'package:health_and_care/ui/food_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:health_and_care/screens_data/activity_data/activity_list.dart';
import 'package:health_and_care/screens_data/activity_data/activity.dart';

class ActivityPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ActivityPageState();
  }
}

class ActivityPageState extends State<ActivityPage> {
  static Route<dynamic> route() => MaterialPageRoute(
        builder: (context) => ActivityPage(),
      );

  static ActivityList activityItems = ActivityList();

  List<String> activityList = [
    'Walking',
    'Running',
    'Dance',
    'Football',
    'Gym'
  ];

  String _currentItemSelected = 'Walking';
  String _activity = 'Walking';
  String _duration;
  String _calories;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    setState(() {});
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildActivity() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Activity',
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Activity is required';
        }
        return null;
      },
      onSaved: (String value) {
        _activity = value;
      },
    );
  }

  Widget _buildDuration() {
    return TextFormField(
      key: Key('Enter duration'),
      decoration: InputDecoration(
        hintText: 'Enter duration in minutes',
        labelText: 'Duration',
      ),
      validator: (String value) {
        int duration = int.tryParse(value);

        if (duration == null || duration < 0) {
          return 'Duration must be greater than 0 min';
        }

        return null;
      },
      onSaved: (String value) {
          _duration = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    //ActivityNotifier activityNotifier = Provider.of<ActivityNotifier>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text("Activity"),
          backgroundColor: Colors.deepPurpleAccent,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            padding: EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildDuration(),
                  SizedBox(height: 10),
                  new DropdownButton<String>(
                    items: <String>[
                      'Walking',
                      'Running',
                      'Dance',
                      'Football',
                      'Gym'
                    ].map((String value) {
                      return new DropdownMenuItem<String>(
                        value: value,
                        child: new Text(value),
                      );
                    }).toList(),
                    onChanged: (String newValueSelected) {
                      setState(() {
                        _currentItemSelected = newValueSelected;
                        _activity = _currentItemSelected;
                      });
                      onSaved:
                      (String value) {
                        _activity = value;
                      };
                    },
                    value: _currentItemSelected,
                  ),
                  SizedBox(height: 20),
                  RaisedButton(
                    key: Key('Add Activity'),
                    child: Text(
                      'Add Activity',
                      style: TextStyle(color: Colors.purple, fontSize: 16),
                    ),
                    onPressed: () {
                      if (!_formKey.currentState.validate())
                        return;
                      else {
                        _formKey.currentState.save();

                        setState(() {
                          Activity newActivity = Activity(
                              '${new DateTime.now()}', _activity, _duration);
                          ActivityList.addActivity(newActivity);
                        });
                      }
                      //ActivityDatabaseProvider().
                    },
                  ),
                  SizedBox(height: 60),
                  RaisedButton(
                    child: Text(
                      'View your activity this week',
                      style: TextStyle(color: Colors.blue, fontSize: 16),
                    ),
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ActivityListPage()),
                    ),
                  ),
                ],
              ),
            )));
  }
}
