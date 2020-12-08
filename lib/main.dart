import 'dart:async';
import 'package:health_and_care/navigation/tab_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens_data/activity_data/activity_database.dart';
import 'screens_data/activity_data/activity_list.dart';
import 'screens_data/sleep_data/sleep_database.dart';
import 'screens_data/sleep_data/sleep_list.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DatabaseSleepManager.initDB();
  await SleepList.initList();

  await DatabaseManager.initDB();
  await ActivityList.initList();

  runApp(MyApp());

  /*runApp(
      MultiProvider(providers: [
        ChangeNotifierProvider(
          builder: (context) => ActivityNotifier(),
        ),
      ],
          child: MyApp()
      )
  );*/
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


