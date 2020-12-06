import 'package:flutter/material.dart';
import 'package:health_and_care/food_screens/breakfast.dart';
import 'package:health_and_care/food_screens/dinner.dart';
import 'package:health_and_care/food_screens/lunch.dart';
import 'package:health_and_care/food_screens/snack.dart';


class FoodWork{
  static Nutrient breakfast = Nutrient(0,0,0,0);
  static Nutrient lunch = Nutrient(0,0,0,0);
  static Nutrient dinner = Nutrient(0,0,0,0);
  static Nutrient snack = Nutrient(0,0,0,0);
  static Nutrient total = Nutrient(0,0,0,0);

  static updateFoodData(){
    total = breakfast + lunch + dinner + snack;
  }

}

class BreakfastMeal extends StatelessWidget {
  final String _mealTime = 'Breakfast';
  @override
  Widget build(BuildContext context) {
    return new Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        height: MediaQuery.of(context).size.height/7,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          color: Colors.white,
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
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Breakfast()));
                  },
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
                        '${FoodWork.breakfast.cal}',
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
                  margin: EdgeInsets.only(left: 60),
                  child: Column(
                    children: [
                      Text('${FoodWork.breakfast.prot}'),
                    ],
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(left: 60),
                    child: Column(
                      children: [
                        Text('${FoodWork.breakfast.fat}'),
                      ],
                    )),
                Container(
                  margin: EdgeInsets.only(left: 60),
                  child: Column(
                    children: [
                      Text('${FoodWork.breakfast.carb}'),
                    ],
                  ),
                ),
              ],
            ),
          )
        ]));
  }
}

class LunchMeal extends StatelessWidget {
String _mealTime = 'Lunch';

  @override
  Widget build(BuildContext context) {
    return new Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        height: MediaQuery.of(context).size.height/7,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          color: Colors.white,
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
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Lunch()));
                  },
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
                        '${FoodWork.lunch.cal}',
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
                  margin: EdgeInsets.only(left: 60),
                  child: Column(
                    children: [
                      Text('${FoodWork.lunch.prot}'),
                    ],
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(left: 60),
                    child: Column(
                      children: [
                        Text('${FoodWork.lunch.fat}'),
                      ],
                    )),
                Container(
                  margin: EdgeInsets.only(left: 60),
                  child: Column(
                    children: [
                      Text('${FoodWork.lunch.carb}'),
                    ],
                  ),
                ),
              ],
            ),
          )
        ]));
  }
}

class DinnerMeal extends StatelessWidget {
  final String _mealTime = 'Dinner';
  @override
  Widget build(BuildContext context) {
    return new Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        height: MediaQuery.of(context).size.height/7,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          color: Colors.white,
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
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Dinner()));
                  },
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
                        '${FoodWork.dinner.cal}',
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
                  margin: EdgeInsets.only(left: 60),
                  child: Column(
                    children: [
                      Text('${FoodWork.dinner.prot}'),
                    ],
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(left: 60),
                    child: Column(
                      children: [
                        Text('${FoodWork.dinner.fat}'),
                      ],
                    )),
                Container(
                  margin: EdgeInsets.only(left: 60),
                  child: Column(
                    children: [
                      Text('${FoodWork.dinner.carb}'),
                    ],
                  ),
                ),
              ],
            ),
          )
        ]));
  }
}

class SnackMeal extends StatelessWidget {
  final String _mealTime = 'Snack';
  @override
  Widget build(BuildContext context) {
    return new Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        height: MediaQuery.of(context).size.height/7,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          color: Colors.white,
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
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Snack()));
                  },
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
                        '${FoodWork.snack.cal}',
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
                  margin: EdgeInsets.only(left: 60),
                  child: Column(
                    children: [
                      Text('${FoodWork.snack.prot}'),
                    ],
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(left: 60),
                    child: Column(
                      children: [
                        Text('${FoodWork.snack.fat}'),
                      ],
                    )),
                Container(
                  margin: EdgeInsets.only(left: 60),
                  child: Column(
                    children: [
                      Text('${FoodWork.snack.carb}'),
                    ],
                  ),
                ),
              ],
            ),
          )
        ]));
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
        height: MediaQuery.of(context).size.height/8,
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
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                  '${(0.3 * water_capacity).toStringAsFixed(1)} l of water'),
            ),
            FlatButton(
              //backgroundColor: Colors.deepPurpleAccent,
                child: Icon(Icons.local_drink),
                onPressed: () {
                  setState(() {
                    water_capacity += 1;
                  });
                }
              //Water.incWater
            )
          ],
        ));
  }
}

class Nutrient{
  double _prot;
  double _fat;
  double _carb;
  double _cal;



  static Nutrient day_nutrients = Nutrient(0,0,0,0);

  Nutrient(this._prot, this._fat, this._carb, this._cal);

  @override
  Nutrient operator +(Nutrient add_nutr){
    _prot = prot + add_nutr.prot;
    _fat = fat + add_nutr.fat;
    _carb = carb + add_nutr.carb;
    _cal = cal + add_nutr.cal;
  }

  double get prot {
    return _prot;
  }

  double get fat {
    return _fat;
  }

  double get carb {
    return _carb;
  }

  double get cal {
    return calcCal();
  }

  void set prot(double value){
    _prot = value;
  }

  void set fat(double value){
    _fat = value;
  }

  void set carb(double value){
    _carb = value;
  }

  double calcCal(){
    return 4*(_prot+_carb) + 8*_fat;
  }

  static updateNutrients(){

  }
}