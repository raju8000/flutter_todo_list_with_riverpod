import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todos/models/todo_model.dart';
import 'package:todos/providers/todos_notifier.dart';

class AddTodoPage extends StatefulWidget {
  @override
  _AddTodoPageState createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  final todoTextController = TextEditingController();
  bool completeStatus = false;

  @override
  void dispose() {
    todoTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add new Todo"),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                TextField(
                  controller: todoTextController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Todo title',
                  ),
                ),
                CheckboxListTile(
                  value: completeStatus,
                  onChanged: (bool checked) {
                    setState(() {
                      completeStatus = checked;
                    });
                  },
                  title: Text('Complete?'),
                ),
                Consumer(
                    builder: (_, WidgetRef ref, __) {
                    return ElevatedButton(
                      onPressed:()=> onAdd(ref),
                      child: Text("Add"),
                    );
                  }
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void onAdd(WidgetRef ref) {
    final String todoTitle = todoTextController.text;
    final bool complete = completeStatus;

    if(todoTitle.isNotEmpty){
      final Todo todo = Todo(title: todoTitle, completed: complete);
      ref.watch(todoNotifier).addTodo(todo);
    }
    Navigator.pop(context);
  }
}
