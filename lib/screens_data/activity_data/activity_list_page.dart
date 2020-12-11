import 'package:flutter/material.dart';
import 'package:health_and_care/ui/activity_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:health_and_care/screens_data/activity_data/activity_list.dart';
import 'file:///C:/Users/maxim/AndroidStudioProjects/health_and_care/lib/screens_data/activity_data/activity.dart';


class ActivityListPage extends StatefulWidget {
  @override
  ActivityListPageState createState() => ActivityListPageState();
}

class ActivityListPageState extends State<ActivityListPage> {
  @override
  Widget build(BuildContext context) {
    print('Building ActivityList Page');
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
                'Your Activity This Week  ' /*+ (activityNotifier.activityItems.length).toString()*/,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              SizedBox(height: 50),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[300],
              ),
              child: SizedBox(
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
                            ),
                            MaterialButton(
                              color: Colors.redAccent,
                              height: 25,
                              child: Text('Remove activity'),
                              onPressed: (){
                                print('Removing activity from ActivityList');
                                setState(() {
                                  ActivityList.remove(ActivityList.activityList[index]);
                                });
                                print(ActivityList.activityList);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    itemCount: ActivityList.size,
                  ),
                ),
            ),
            ],
          ),
        ));
  }
}