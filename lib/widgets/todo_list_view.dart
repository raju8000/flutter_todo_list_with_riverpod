import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todos/models/todo_model.dart';
import 'package:todos/providers/todos_notifier.dart';

class TodoListView extends StatelessWidget {
  final List<Todo> todos;

  const TodoListView({Key key, this.todos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) => Consumer(
          // 2. specify the builder and obtain a WidgetRef
            builder: (_, WidgetRef ref, __) {
              final todoProvider = ref.watch(todoNotifier);
            return ListTile(
              title: Text(todos[index].title),
              leading: Checkbox(
                  value: todos[index].completed,
                  onChanged: (bool checked) {
                    todoProvider.toggleTodo(todos[index]);
                  }),
              trailing: IconButton(
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    todoProvider.deleteTodo(todos[index]);
                  }),
            );
          }
        ),
        itemCount: todos.length,
      ),
    );
  }
}
