import 'package:flutter/material.dart';

class TodoController extends ChangeNotifier {
  String todoTitle = '';

  setTodoTitle(String value) {
    todoTitle = value;
    notifyListeners();
  }
}
