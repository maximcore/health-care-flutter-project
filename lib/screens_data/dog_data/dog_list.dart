import 'package:flutter/material.dart';
import 'package:health_and_care/ui/dog_screen.dart';


class Dogs extends StatefulWidget {
  @override
  _DogsState createState() => _DogsState();
}

class _DogsState extends State<Dogs> {

  @override
  void initState() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Dogs'),
          backgroundColor: Colors.deepPurpleAccent,
          centerTitle: true,
        ),
        body: new ListView.builder(
          itemCount: DogPageState.dog_link.length,
          itemBuilder: (BuildContext context, int index){
            return new Image.network(DogPageState.dog_link[index]);
          },
        ));
  }
}
