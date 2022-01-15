import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todos/models/todo_model.dart';
import 'dart:collection';


final todoNotifier = ChangeNotifierProvider<TodoNotifier>((ref) => TodoNotifier());

class TodoNotifier with ChangeNotifier{
  List<Todo> _todos = [
    Todo(title: 'Todo One'),
    Todo(title: 'Todo Two'),
    Todo(title: 'Todo Three'),
    Todo(title: 'Todo four'),
  ];

  UnmodifiableListView<Todo> get allTodos => UnmodifiableListView(_todos);

  UnmodifiableListView<Todo> get inCompleteTodos => UnmodifiableListView(_todos.where((Todo todo) {
    /// Return In-Completed todos items
    return todo.completed == false;
  }));

  UnmodifiableListView<Todo> get completeTodos => UnmodifiableListView(_todos.where((Todo todo) {
    /// Return Completed todos items
    return todo.completed;
  }));

  void addTodo(Todo todo) {
    /// Add new task and update list
    _todos.add(todo);
    notifyListeners();
  }

  void deleteTodo(Todo todo) {
    /// Delete a task and update list
    _todos.remove(todo);
    notifyListeners();
  }

  void toggleTodo(Todo todo) {
    /// Make a task complete or pending
    final todoIndex = _todos.indexOf(todo);

    _todos[todoIndex].toggleCompleted();
    notifyListeners();
  }

}