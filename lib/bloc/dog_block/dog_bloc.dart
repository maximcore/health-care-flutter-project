import 'dart:async';
import 'package:flutter/material.dart';

abstract class CounterEvent {}

class IncrementEvent extends CounterEvent {}

class DecrementEvent extends CounterEvent {}

class DogBloc{
  int _dogs = 1;

  final _inputEventController = StreamController<CounterEvent>.broadcast();
  StreamSink<CounterEvent> get inputEventSink => _inputEventController.sink;

  final _outputStateController = StreamController<int>.broadcast();
  Stream<int> get outputStateStream => _outputStateController.stream;

  void _mapEventToState(CounterEvent event){
    print('DogBloc mapEventToState');
    if(event is IncrementEvent && _dogs < 50)
      _dogs++;
    else if(event is DecrementEvent && _dogs > 1)
      _dogs--;
    else throw Exception('Wrong Event');

    _outputStateController.sink.add(_dogs);
  }

  DogBloc() {
    print('DogBloc Listen');
    _inputEventController.stream.listen(_mapEventToState);
  }

  void dispose(){
    _inputEventController.close();
    _outputStateController.close();
  }

}