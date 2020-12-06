import 'package:flutter/material.dart';
import 'package:health_and_care/screens_data/food_data/FoodInfo.dart';
import 'package:health_and_care/food_screens/breakfast.dart';
import 'package:health_and_care/food_screens/dinner.dart';
import 'package:health_and_care/food_screens/lunch.dart';
import 'package:health_and_care/food_screens/snack.dart';

import 'package:health_and_care/screens_data/food_data/food_data.dart';

class FoodPage extends StatefulWidget {
  @override
  static Route<dynamic> route() => MaterialPageRoute(
        builder: (context) => FoodPage(),
      );

  @override
  FoodPageState createState() => FoodPageState();
}

class FoodPageState extends State<FoodPage> {


  @override
  void initState() {
   FoodInfo.getData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Food"),
        backgroundColor: Colors.deepPurpleAccent,
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              Expanded(
                  child: Scaffold(
                backgroundColor: Colors.grey[200],
                body: Container(
                  padding: EdgeInsets.only(top: 16.0),
                  child: ListView(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 30.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    'prot',
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Text('${FoodWork.total.prot}'),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    'fat',
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Text('${FoodWork.total.fat}'),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    'carb',
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Text('${FoodWork.total.carb}'),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    'calories',
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Text('${FoodWork.total.cal}'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),


                      BreakfastMeal(),
                      SizedBox(height: 5),
                      LunchMeal(),
                      SizedBox(height: 5),
                      DinnerMeal(),
                      SizedBox(height: 5),
                      SnackMeal(),
                      SizedBox(height: 5),
                      Water(),
                    ],
                  ),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}

