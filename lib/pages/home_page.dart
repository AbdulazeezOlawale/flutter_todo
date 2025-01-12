// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_todo/util/DialogBox.dart';
import 'package:flutter_todo/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List todoItem = [
    ["First itme", false],
    ["second itme", false],
    ["third itme", false],
  ];

  void onChanged(bool? value, int index) {
    setState(() {
      todoItem[index][1] = !todoItem[index][1];
    });
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) => DialogBox(),
    );
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
        itemCount: todoItem.length,
        itemBuilder: (BuildContext context, int index) {
          return TodoTile(
            taskName: todoItem[index][0],
            taskCompleted: todoItem[index][1],
            onChanged: (p0) => onChanged(p0, index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => createNewTask(),
        child: Icon(Icons.add),
      ),
    );
  }
}
