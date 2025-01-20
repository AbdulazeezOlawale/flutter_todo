// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_todo/data/dataBase.dart';
import 'package:flutter_todo/util/DialogBox.dart';
import 'package:flutter_todo/util/todo_tile.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // reference the box
  final _myBox = Hive.box('myBox');

  final _controller = TextEditingController();

  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    if (_myBox.get('todoItem') == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }

    super.initState();
  }

  void onChanged(bool? value, int index) {
    setState(() {
      db.todoItem[index][1] = !db.todoItem[index][1];
    });
    db.updateDatabase();
  }

  void submitData() {
    setState(() {
      db.todoItem.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDatabase();
  }

  void newTask() {
    showDialog(
      context: context,
      builder: (context) => DialogBox(
          cancleData: () => Navigator.of(context).pop(),
          submitData: submitData,
          controller: _controller),
    );
  }

  void deleteItem(int index) {
    setState(() {
      db.todoItem.removeAt(index);
    });
  }

  void displayItem() {
    print("the bane");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Title(
          color: Colors.white,
          child: Center(
            child: Text(
              "Todo App",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: db.todoItem.length,
        itemBuilder: (BuildContext context, int index) {
          return TodoTile(
            taskName: db.todoItem[index][0],
            taskCompleted: db.todoItem[index][1],
            onChanged: (p0) => onChanged(p0, index),
            deleteItem: (p0) => deleteItem(index),
            onPressed: () => displayItem(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: newTask,
        child: Icon(Icons.add),
      ),
    );
  }
}
