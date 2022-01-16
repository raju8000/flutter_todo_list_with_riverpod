import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todos/models/todo_model.dart';
import 'package:todos/providers/todos_notifier.dart';
import 'package:todos/widgets/todo_list_view.dart';

class CompleteTodos extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Todo> completeTodos = ref.watch(todoNotifier).completeTodos;

    return Container(
        child: TodoListView(
      todos: completeTodos,
    ));
  }
}
