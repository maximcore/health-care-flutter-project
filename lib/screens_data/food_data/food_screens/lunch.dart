import 'package:flutter/material.dart';
import 'package:health_and_care/screens_data/food_data/food_info.dart';

import '../food_data.dart';
import 'add_food.dart';


class Lunch extends StatefulWidget {
  @override
  LunchState createState() => LunchState();
}

class LunchState extends State<Lunch> {

  String _currentItemSelected = 'Choose food';
  String _meal = 'Choose food';


  double _portionWeight = 0;

  Widget _buildPortionWeight() {
    print('Building portion weight textformfield');
    return TextFormField(
      key: Key('Enter portion weight'),
      decoration: InputDecoration(
        hintText: 'Enter weight in g',
        labelText: 'Grams',
      ),
      validator: (String value) {
        double portionWeight = double.tryParse(value);
        if (portionWeight == null || portionWeight < 0.0) {
          return 'Weight must be greater than 0 g';
        }
        return null;
      },
      onSaved: (String value) {
        _portionWeight = double.tryParse(value);
      },
    );
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<String> foodNameList = FoodInfo.getFoodNameList();
  String dropdownValue = 'Apple';


  @override
  Widget build(BuildContext context) {
    print('Building LunchScreen');
    return Scaffold(
        appBar: AppBar(
          title: Text('Add your lunch'),
          backgroundColor: Colors.deepPurpleAccent,
          centerTitle: true,
        ),
        body: Container(
          child:
          Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: DropdownButton<String>(
                    value: dropdownValue,
                    icon: Icon(Icons.arrow_downward),
                    iconSize: 24,
                    underline: Container(
                      height: 1,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue = newValue;
                      });
                    },
                    items: foodNameList
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(height: 20),
                _buildPortionWeight(),
                SizedBox(height: 20),
                RaisedButton(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Text(
                    'Add Food',
                    style: TextStyle(fontSize: 16),
                  ),
                  onPressed: () {
                    print('Adding lunch portion');
                    if (!_formKey.currentState.validate())
                      return;
                    else {
                      _formKey.currentState.save();
                      setState(() {
                        for (int i = 0; i < FoodInfo.dishes.length; i++) {
                          if (FoodInfo.dishes[i].name == dropdownValue) {
                            print('${FoodInfo.dishes[i].name} ${FoodInfo.dishes[i].cal*_portionWeight/100}');
                            FoodWork.lunch.add(Nutrient(
                                FoodInfo.dishes[i].prot*_portionWeight/100,
                                FoodInfo.dishes[i].fat*_portionWeight/100,
                                FoodInfo.dishes[i].carb*_portionWeight/100,
                                FoodInfo.dishes[i].cal*_portionWeight/100
                            ));
                          }
                        }
                      });
                    }
                  },
                ),
              ],
            ),
          ),


        ));
  }
}

