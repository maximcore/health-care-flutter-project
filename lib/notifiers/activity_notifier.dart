import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:health_and_care/ui/activity_screen.dart';
import 'file:///C:/Users/maxim/AndroidStudioProjects/health_and_care/lib/screens_data/activity_data/activity.dart';
import 'package:health_and_care/ui/activity_screen.dart';

class ActivityNotifier with ChangeNotifier{
  //List<Activity> _activityItems = []

  List<Activity> _activityItems;

  UnmodifiableListView<Activity> get activityItems => UnmodifiableListView(_activityItems);

  void addActivityItem(Activity activity){
    _activityItems.add(activity);
    notifyListeners();
  }
}