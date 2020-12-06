import 'package:flutter/material.dart';
import 'package:health_and_care/screens_data/food_data/FoodInfo.dart';


class Dinner extends StatefulWidget {
  @override
  DinnerState createState() => DinnerState();
}

class DinnerState extends State<Dinner> {

  String _currentItemSelected = 'Choose food';
  String _meal = 'Choose food';



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Dinner'),
          backgroundColor: Colors.deepPurpleAccent,
          centerTitle: true,
        ),
        body: Container(
          margin: EdgeInsets.all(24),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height/1.5,
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) => Card(
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: <Widget>[
                          Text(
                            '${FoodInfo.dishes[index].name}',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            '''${(FoodInfo.dishes[index].cal).toString().substring(0,5)} calories ${FoodInfo.dishes[index].prot} g of prot  ${FoodInfo.dishes[index].fat} g of fat ${FoodInfo.dishes[index].carb} g of carb''',
                            style: TextStyle(
                              fontSize: 8,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  itemCount: 17,
                ),
              ),
            ],
          ),
        ));
  }
}

