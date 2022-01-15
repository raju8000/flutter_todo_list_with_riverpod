import 'package:flutter/foundation.dart';

class Todo{
  String title;
  bool completed;

  Todo({ this.completed = false, @required this.title});

  void toggleCompleted() {
    completed = !completed;
  }

}