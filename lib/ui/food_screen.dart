import 'package:flutter/material.dart';

class FoodPage extends StatelessWidget {
  @override
  static Route<dynamic> route() => MaterialPageRoute(
        builder: (context) => FoodPage(),
      );

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
                                  Text('200'),
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
                                  Text('200'),
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
                                  Text('200'),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    'total',
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Text('3200'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      MealTime('Breakfast', Colors.white),
                      MealTime('Lunch', Colors.white),
                      MealTime('Dinner', Colors.white),
                      MealTime('Snack', Colors.white),
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

class Water extends StatefulWidget {
  @override
  Water_State createState() => Water_State();
}

class Water_State extends State<Water> {
  int water_capacity = 0;
  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      width: 100,
      height: 50,
      decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.white, Colors.lightBlueAccent],
            ),
       // color: Colors.lightBlueAccent[100],
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          bottomRight: Radius.circular(30),
          topLeft: Radius.circular(30),
          bottomLeft: Radius.circular(30),


        ),),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child:
            Text('${(0.3*water_capacity).toStringAsFixed(1)} l of water'),
          ),
          FlatButton(
              //backgroundColor: Colors.deepPurpleAccent,
              child: Icon(Icons.local_drink),
              onPressed: () {
                setState(() {
                  water_capacity+=1;
                });
              }
            //Water.incWater
          )
        ],
      )

    );
  }
}

/*
class Water extends StatefulWidget {

   @override
   State<StatefulWidget> createState() {
     return _WaterState();
   }

  @override
  Widget build(BuildContext context) {
    return new Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        width: 100,
        height: 50,
    decoration: BoxDecoration(
      color: Colors.lightBlueAccent[100],
    borderRadius: BorderRadius.only(
    topRight: Radius.circular(30),
    bottomRight: Radius.circular(30),
    topLeft: Radius.circular(30),
    bottomLeft: Radius.circular(30),
    ),),
        child: Center(
          child:
              Text('${(0.3*capacity).toStringAsFixed(1)} l of water'),

          ),
        );

  }
}
*/


class Nutrient extends StatelessWidget {
  final String _nutrient_name;
  final int _nutrient_value;

  Nutrient(this._nutrient_name, this._nutrient_value);

  @override
  Widget build(BuildContext context) {
    return new Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
        ));
  }
}

class MealTime extends StatelessWidget {
  final String _mealTime;
  final Color _my_color;

  MealTime(this._mealTime, this._my_color);

  @override
  Widget build(BuildContext context) {
    return new Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          color: _my_color,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(30),
            topLeft: Radius.circular(30),
            bottomLeft: Radius.circular(30),
          ),
        ),
        child: Column(children: <Widget>[
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                RawMaterialButton(
                  onPressed: () {},
                  elevation: 2.0,
                  fillColor: Colors.deepPurpleAccent,
                  child: Icon(
                    Icons.add,
                    size: 16.0,
                  ),
                  padding: EdgeInsets.all(8.0),
                  shape: CircleBorder(),
                ),
                Expanded(
                    child: Text(
                  _mealTime,
                  style: TextStyle(
                    fontSize: 20.0,
                    wordSpacing: 12.0,
                    fontWeight: FontWeight.bold,
                  ),
                )),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        '800',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
          Container(
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 30),
                  child: Column(
                    children: [
                      Text('50'),
                    ],
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(left: 60),
                    child: Column(
                      children: [
                        Text('50'),
                      ],
                    )),
                Container(
                  margin: EdgeInsets.only(left: 60),
                  child: Column(
                    children: [
                      Text('50'),
                    ],
                  ),
                ),
              ],
            ),
          )
        ]));
  }
}
