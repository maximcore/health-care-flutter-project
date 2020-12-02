import 'dart:async';
import 'package:health_and_care/pages/tab_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_and_care/sleep_data/sleep_database.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:provider/provider.dart';
import 'notifiers/activity_notifier.dart';
import 'activity_data/activity_database.dart';
import 'package:health_and_care/activity_data/activity_list.dart';
import 'sleep_data/sleep_database.dart';
import 'sleep_data/sleep_list.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DatabaseSleepManager.initDB();
  await SleepList.initList();

  await DatabaseManager.initDB();
  await ActivityList.initList();

  runApp(
      MultiProvider(providers: [
        ChangeNotifierProvider(
          builder: (context) => ActivityNotifier(),
        ),
      ],
          child: MyApp()
      )
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(fontFamily: 'Montserrat'),
        title: 'Health & Care',
        home: TabsPage()
    );
  }
}


