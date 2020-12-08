import 'food_data.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class FoodInfo{

  static List<Dish> dishes = [
  ];
  static List<String> foodName = [];

  static Map<String, dynamic> map;

  static Future<String> getData() async {
    var response = await http.get(
        Uri.encodeFull("https://raw.githubusercontent.com/maximcore/demo/master/foodlist.json"),
        headers: {"Accept": "application/json"});
    map = json.decode(response.body);

    for(int i = 0; i<17;i++){
      dishes.add(Dish(map['dish'][i]['dish'],
          Nutrient(
              double.tryParse(map['dish'][i]['prot']),
              double.tryParse(map['dish'][i]['fat']),
              double.tryParse(map['dish'][i]['carb']),
              double.tryParse(map['dish'][i]['cal'])
          )
      )
      );
    }

    for(int i = 0;i<dishes.length;i++){
      foodName.add(dishes[0].name);
    }

  }

}



class Dish {
  String _name;
  Nutrient _nutrients;
  Dish(this._name, this._nutrients);

  String get name {
    return _name;
  }

  double get prot {
    return _nutrients.prot;
  }

  double get fat {
    return _nutrients.fat;
  }

  double get carb {
    return _nutrients.carb;
  }

  double get cal {
    return _nutrients.cal;
  }

}