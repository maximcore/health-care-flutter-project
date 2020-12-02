import 'package:flutter/material.dart';
import 'package:health_and_care/notifiers/activity_notifier.dart';
import 'package:health_and_care/ui/activity_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:health_and_care/activity_data/activity_list.dart';
import 'file:///C:/Users/maxim/AndroidStudioProjects/health_and_care/lib/activity_data/activity.dart';


class ActivityListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //ActivityNotifier activityNotifier = Provider.of<ActivityNotifier>(context);



    print('List page rebuilt');


    return Scaffold(
        appBar: AppBar(
          title: Text('Activity List'),
          backgroundColor: Colors.deepPurpleAccent,
          centerTitle: true,
        ),
        body: Container(
          margin: EdgeInsets.all(24),
          child: Column(
            children: <Widget>[
              Text(
                'Your Activity Today  ' /*+ (activityNotifier.activityItems.length).toString()*/,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              SizedBox(height: 50),
            SizedBox(
                height: MediaQuery.of(context).size.height/2,
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) => Card(
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: <Widget>[
                          Text(
                            ActivityPageState.activityItems[index].activity +
                                ' - ${ActivityPageState.activityItems[index].duration} min',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            '${ActivityPageState.activityItems[index].calories} cal',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  itemCount: ActivityList.size,
                ),
              ),
            ],
          ),
        ));
  }
}