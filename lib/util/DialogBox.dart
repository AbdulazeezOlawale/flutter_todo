// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_todo/util/MyButtons.dart';

class DialogBox extends StatelessWidget {
  const DialogBox({super.key});

  void submitData() {
    print("Item submitted");
  }

  void cancleData() {
    print("Item cancled");
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Container(
        height: 120,
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Enter a text"),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: MyBtns(btnName: "Submit", onPressed: submitData),
                ),
                MyBtns(btnName: "Cancle", onPressed: cancleData),
              ],
            )
          ],
        ),
      ),
    );
  }
}
