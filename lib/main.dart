import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todos/pages/add_todo_page.dart';
import 'package:todos/pages/all_todos_page.dart';
import 'package:todos/pages/complete_todos_page.dart';
import 'package:todos/pages/incomplete_todos_page.dart';

void main() => runApp(ProviderScope(child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Todo',
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData(primarySwatch: Colors.blue, brightness: Brightness.light),
      home: MyHomePage(
        title: 'Todo App',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            actions: <Widget>[
              IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddTodoPage()));
                },
                icon: Icon(Icons.add),
              ),
            ],
            bottom: TabBar(
              tabs: [
                Tab(text: 'All'),
                Tab(text: 'Complete'),
                Tab(text: 'In Complete'),
              ],
            ),
            title: Text(widget.title),
          ),
          body: TabBarView(
            children: [
              AllTodos(),
              CompleteTodos(),
              InCompleteTodos(),
            ],
          )),
    );
  }
}