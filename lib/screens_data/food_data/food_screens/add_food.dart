import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:health_and_care/screens_data/sleep_data/sleep.dart';
import 'package:health_and_care/screens_data/sleep_data/sleep_database.dart';
import 'package:health_and_care/screens_data/sleep_data/sleep_list.dart';

import 'package:intl/intl.dart';

import '../food_data.dart';
import '../food_info.dart';

class AddFoodPage extends StatefulWidget {
  static Route<dynamic> route() => MaterialPageRoute(
    builder: (context) => AddFoodPage(),
  );

  @override
  AddFoodPageState createState() => AddFoodPageState();
}

class AddFoodPageState extends State<AddFoodPage> {
  SleepList sleepList = SleepList();

  static List<Dish> _foodList = [];

  static List<Dish> getFoodList () => _foodList;

  static countCalories(){

  }

  @override
  void initState() {
    super.initState();
  }

  int _portion_weight = 0;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildWeight() {
    var input_controller = TextEditingController();
    return TextFormField(
      controller: input_controller,
      decoration: InputDecoration(
        hintText: 'Enter portion weight',
        labelText: 'Weight',
        contentPadding: EdgeInsets.only(left: 20, right: 20),
        suffixIcon: IconButton(
          onPressed: () => input_controller.clear(),
          icon: Icon(Icons.clear),
        ),
      ),
      validator: (String value) {
        int duration = int.tryParse(value);

        if (duration == null || duration < 0) {
          return 'Weight must be greater than 0 min';
        }
        return null;
      },
      onSaved: (String value) {
        _portion_weight = int.tryParse(value);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        centerTitle: true,
      ),
      body: Center(
          child: Container(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Form(
                    key: _formKey,
                    child: _buildWeight(),
                  ),
                  RaisedButton(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Text(
                      'Add Food',
                      style: TextStyle(fontSize: 16),
                    ),
                    onPressed: () {
                      if (!_formKey.currentState.validate())
                        return;
                      else {
                        _formKey.currentState.save();
                        setState(() {
                        });
                      }
                    },
                  ),
                  Text('${_foodList.length}'),
                ],
              ),
            ),
          )),
    );
  }
}
