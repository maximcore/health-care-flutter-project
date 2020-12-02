import 'package:flutter/material.dart';
import 'package:health_and_care/notifiers/activity_notifier.dart';
import 'package:health_and_care/ui/activity_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:health_and_care/activity_data/activity_list.dart';
import 'file:///C:/Users/maxim/AndroidStudioProjects/health_and_care/lib/activity_data/activity.dart';


class AddSleepPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AddSleepPageState();
  }
}


class AddSleepPageState extends State<AddSleepPage> {


  static ActivityList activityItems = ActivityList();



  String _day;
  String _duration;



  @override
  void initState() {
    super.initState();
    getData();
  }



  getData() async {
    setState(() {
    });
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();



  Widget _buildDuration() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Enter sleep duration in minutes',
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
                  SizedBox(height: 20),

                  SizedBox(height: 60),

                ],
              ),
            )));
  }
}




/*
Widget _buildAddSleep() {
  return TextFormField(
    decoration: InputDecoration(
      hintText: 'Enter sleep duration in minutes',
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

class AddSleepPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text('Add Sleep Page'),
          backgroundColor: Colors.deepPurpleAccent,
          centerTitle: true,
        ),
        body: Container(
          margin: EdgeInsets.all(24),
          child: Column(
            children: <Widget>[
              Text(
                'Your Sleep Info' ,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              SizedBox(height: 50),
              SizedBox(

              ),
            ],
          ),
        ));
  }
}*/
