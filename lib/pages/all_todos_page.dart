import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todos/providers/todos_notifier.dart';
import 'package:todos/widgets/todo_list_view.dart';

class AllTodos extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allTodos = ref.watch(todoNotifier).allTodos;
    return Container(
      child: TodoListView(todos: allTodos,),
    );
  }
}
