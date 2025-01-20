// ignore_for_file: prefer_const_constructors, must_be_immutable, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext) deleteItem;
  VoidCallback onPressed;

  TodoTile(
      {super.key,
      required this.taskName,
      required this.taskCompleted,
      required this.onChanged,
      required this.deleteItem,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(
            onPressed: deleteItem,
            icon: Icons.delete,
            backgroundColor: Colors.red.shade300,
            borderRadius: BorderRadius.circular(9),
          )
        ]),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.deepPurple, borderRadius: BorderRadius.circular(9)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Checkbox(value: taskCompleted, onChanged: onChanged),
                Text(
                  taskName,
                  style: TextStyle(
                      color: Colors.white,
                      decoration: taskCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none),
                ),
                MaterialButton(
                  color: Colors.black,
                  onPressed: () => onPressed,
                  child: Text(
                    'data',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
