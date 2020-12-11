import 'package:flutter/material.dart';
import 'package:health_and_care/screens_data/food_data/food_screens/breakfast.dart';
import 'package:health_and_care/screens_data/food_data/food_screens/dinner.dart';
import 'package:health_and_care/screens_data/food_data/food_screens/lunch.dart';
import 'package:health_and_care/screens_data/food_data/food_screens/snack.dart';


class FoodWork{


  static List<Nutrient> breakfast = List();
  static List<Nutrient> lunch = List();
  static List<Nutrient> dinner = List();
  static List<Nutrient> snack = List();

  static Nutrient breakfastInfo() {
  double prot = 0;
  double fat = 0;
  double carb = 0;
  double cal = 0;
  for(int i = 0;i< breakfast.length ;i++){
    prot+=breakfast[i].prot;
    fat+=breakfast[i].fat;
    carb+=breakfast[i].carb;
  }
  return Nutrient(prot,fat,carb,cal);
  }

  static Nutrient lunchInfo() {
    double prot = 0;
    double fat = 0;
    double carb = 0;
    double cal = 0;
    for(int i = 0;i< lunch.length ;i++){
      prot+=lunch[i].prot;
      fat+=lunch[i].fat;
      carb+=lunch[i].carb;
    }
    return Nutrient(prot,fat,carb,cal);
  }

  static Nutrient dinnerInfo() {
    double prot = 0;
    double fat = 0;
    double carb = 0;
    double cal = 0;
    for(int i = 0;i< dinner.length ;i++){
      prot+=dinner[i].prot;
      fat+=dinner[i].fat;
      carb+=dinner[i].carb;
    }
    return Nutrient(prot,fat,carb,cal);
  }

  static Nutrient snackInfo() {
    double prot = 0;
    double fat = 0;
    double carb = 0;
    double cal = 0;
    for(int i = 0;i< snack.length ;i++){
      prot+=snack[i].prot;
      fat+=snack[i].fat;
      carb+=snack[i].carb;
    }
    return Nutrient(prot,fat,carb,cal);
  }

  static Nutrient allInfo(){
    double prot = 0;
    double fat = 0;
    double carb = 0;
    double cal = 0;

    for(int i = 0;i< breakfast.length ;i++){
      prot+=breakfast[i].prot;
      fat+=breakfast[i].fat;
      carb+=breakfast[i].carb;
    }

    for(int i = 0;i< lunch.length ;i++){
      prot+=lunch[i].prot;
      fat+=lunch[i].fat;
      carb+=lunch[i].carb;
    }

    for(int i = 0;i< dinner.length ;i++){
      prot+=dinner[i].prot;
      fat+=dinner[i].fat;
      carb+=dinner[i].carb;
    }

    for(int i = 0;i< snack.length ;i++){
      prot+=snack[i].prot;
      fat+=snack[i].fat;
      carb+=snack[i].carb;
    }
    return Nutrient(prot,fat,carb,cal);
  }
}

class BreakfastMeal extends StatefulWidget {
  @override
  _BreakfastMealState createState() => _BreakfastMealState();
}

class _BreakfastMealState extends State<BreakfastMeal> {
final String _mealTime = 'Breakfast';

  @override
  Widget build(BuildContext context) {

  print('Building BreakfastMeal');
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
                      '${double.tryParse('${FoodWork.breakfastInfo().cal}').round().toInt().toString()}',
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
                      Text('${double.tryParse('${FoodWork.breakfastInfo().prot}').round().toInt().toString()}'),
                    ],
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(left: 60),
                    child: Column(
                      children: [
                        Text('${double.tryParse('${FoodWork.breakfastInfo().fat}').round().toInt().toString()}')                      ],
                    )),
                Container(
                  margin: EdgeInsets.only(left: 60),
                  child: Column(
                    children: [
                      Text('${double.tryParse('${FoodWork.breakfastInfo().carb}').round().toInt().toString()}')                    ],
                  ),
                ),
              ],
            ),
          )
        ]));
  }
}

class LunchMeal extends StatefulWidget {
  @override
  _LunchMealState createState() => _LunchMealState();
}

class _LunchMealState extends State<LunchMeal> {
String _mealTime = 'Lunch';

  @override
  Widget build(BuildContext context) {
    print('Building LunchMeal');
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
                        '${double.tryParse('${FoodWork.lunchInfo().cal}').round().toInt().toString()}',
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
                      Text('${double.tryParse('${FoodWork.lunchInfo().prot}').round().toInt().toString()}',
                      ),
                    ],
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(left: 60),
                    child: Column(
                      children: [
                        Text('${double.tryParse('${FoodWork.lunchInfo().fat}').round().toInt().toString()}',
                        ),
                      ],
                    )),
                Container(
                  margin: EdgeInsets.only(left: 60),
                  child: Column(
                    children: [
          Text('${double.tryParse('${FoodWork.lunchInfo().carb}').round().toInt().toString()}',
          ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ]));
  }
}

class DinnerMeal extends StatefulWidget {
  @override
  _DinnerMealState createState() => _DinnerMealState();
}

class _DinnerMealState extends State<DinnerMeal> {
  final String _mealTime = 'Dinner';

  @override
  Widget build(BuildContext context) {
    print('Building DinnerMeal');
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
                      '${double.tryParse('${FoodWork.dinnerInfo().cal}').round().toInt().toString()}',
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
                      Text('${double.tryParse('${FoodWork.dinnerInfo().prot}').round().toInt().toString()}'),
                    ],
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(left: 60),
                    child: Column(
                      children: [
                        Text('${double.tryParse('${FoodWork.dinnerInfo().fat}').round().toInt().toString()}'),
                      ],
                    )),
                Container(
                  margin: EdgeInsets.only(left: 60),
                  child: Column(
                    children: [
                      Text('${double.tryParse('${FoodWork.dinnerInfo().carb}').round().toInt().toString()}',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ]));
  }
}

class SnackMeal extends StatefulWidget {
  @override
  _SnackMealState createState() => _SnackMealState();
}

class _SnackMealState extends State<SnackMeal> {
  final String _mealTime = 'Snack';

  @override
  Widget build(BuildContext context) {
    print('Building SnackMeal');
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
                        '${double.tryParse('${FoodWork.snackInfo().cal}').round().toInt().toString()}',
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
                      Text('${double.tryParse('${FoodWork.snackInfo().prot}').round().toInt().toString()}'),
                    ],
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(left: 60),
                    child: Column(
                      children: [
                        Text('${double.tryParse('${FoodWork.snackInfo().fat}').round().toInt().toString()}'),
                      ],
                    )),
                Container(
                  margin: EdgeInsets.only(left: 60),
                  child: Column(
                    children: [
                      Text('${double.tryParse('${FoodWork.snackInfo().carb}').round().toInt().toString()}'),
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
    print('Building Water Container');
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
                  print('Water capacity increment');
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