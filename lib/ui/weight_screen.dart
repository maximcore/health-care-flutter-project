import 'package:flutter/material.dart';

class WeightPage extends StatelessWidget {
  static Route<dynamic> route() => MaterialPageRoute(
    builder: (context) => WeightPage(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weight"),
        backgroundColor: Colors.deepPurpleAccent,
        centerTitle: true,
      ),
      body: Center(
        child: Text("Hello, weight!"),
      ),
    );
  }
}