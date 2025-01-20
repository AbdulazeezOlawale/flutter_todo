import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List todoItem = [];

  // reference the box
  final _myBox = Hive.box('myBox');

  // run this method when the program loads up for the first time
  void createInitialData() {
    todoItem = [];
  }

  // load the data from the database
  void loadData() {
    todoItem = _myBox.get("todoItem");
  }

  void updateDatabase() {
    _myBox.put("todoItem", todoItem);
  }
}
