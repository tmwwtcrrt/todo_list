import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:todo_list/todo_model.dart';

class TodoProvider with ChangeNotifier {
  List<TodoModel> tasks = [];

  UnmodifiableListView<TodoModel> get allTasks => UnmodifiableListView(tasks);

  void addTask(String task) {
    tasks.add(TodoModel(todoTitle: task, completed: false));
    notifyListeners();
  }

  void toggleTask(TodoModel task) {
    final taskIndex = tasks.indexOf(task);
    tasks[taskIndex].toggleCompleted();
    notifyListeners();
  }

  void deleteTask(TodoModel task) {
    tasks.remove(task);
    notifyListeners();
  }
}