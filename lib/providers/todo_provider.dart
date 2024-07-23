import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../models/todo.dart';

class ToDoProvider with ChangeNotifier {
  final List<ToDo> _todos = [];
  final _uuid = const Uuid();

  List<ToDo> get todos => _todos;

  void addToDo(String title) {
    _todos.add(ToDo(
      id: _uuid.v4(),
      title: title,
    ));
    notifyListeners();
  }

  void toggleToDoStatus(String id) {
    var todo = _todos.firstWhere((todo) => todo.id == id);
    todo.isDone = !todo.isDone;
    notifyListeners();
  }

  void removeToDo(String id) {
    _todos.removeWhere((todo) => todo.id == id);
    notifyListeners();
  }
}
