import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'file:///C:/Users/maxim/AndroidStudioProjects/health_and_care/lib/dog_screens/dog_list.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:openfoodfacts/model/parameter/OutputFormat.dart';

class DogPage extends StatefulWidget {
  static Route<dynamic> route() => MaterialPageRoute(
        builder: (context) => DogPage(),
      );

  @override
  DogPageState createState() => DogPageState();
}

class DogPageState extends State<DogPage> {
  static List dog_link;

  Map<String, dynamic> map;

  Future<String> getData() async {
    var response = await http.get(
        Uri.encodeFull("https://dog.ceo/api/breeds/image/random/10"),
        headers: {"Accept": "application/json"});
    map = json.decode(response.body);
    dog_link = map["message"];
  }

  @override
  void initState() {
    super.initState();
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return Scaffold(
        appBar: AppBar(
          title: Text("Dogs"),
          backgroundColor: Colors.deepPurpleAccent,
          centerTitle: true,
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Text('Why dogs? 🤔',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),),
                  SizedBox(
                    height: MediaQuery.of(context).size.height/2,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Text(text_about_dogs),
                    ),
                  )
                  ,
                  MaterialButton(
                    color: Colors.lightBlueAccent[100],
                    child: Text('Click to see cute dogs 🐶'),
                    onPressed: () {
                      getData();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Dogs()));
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

String text_about_dogs = """Dogs have served as man’s best friend and worked alongside us for thousands and thousands of years. The loyal companionship and unconditional love of dogs has been written about throughout human history.

Our canine buddies are always there for us, in good times and in bad. They are our friends when we are lonely and a reason to laugh when we are down. They are faithful, judgment-free sounding boards who we can play with, snuggle with, and – most importantly – be ourselves with.

Of the dog parents surveyed in BarkBox’s study, 85 percent revealed that their dogs have “helped them get through a difficult time in their life.”

Our four-legged friends teach us patience, compassion, generosity, and kindness. These are all qualities that carry over into our personal and professional lives, and make us better equipped to work and socialize with others.

A study published in the Journal of Personality and Social Psychology revealed that “pet owners exhibited greater self-esteem, were more physically fit, were less lonely, were more conscientious, were more socially outgoing, and had healthier relationship styles (i.e., they were less fearful and less preoccupied) than non-owners.” 

Dogs inspire us to get outside and be more active, which can lead to increased mental well-being over time. One way to look at it is that dogs make us happy because they are the catalyst for other healthy behaviors in our lives.""";