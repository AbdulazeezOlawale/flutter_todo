// ignore_for_file: must_be_immutable, sized_box_for_whitespace, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_todo/util/MyButtons.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback submitData;
  VoidCallback cancleData;
  DialogBox(
      {super.key,
      required this.cancleData,
      required this.submitData,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 120,
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Enter a text"),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: MyBtns(onPressed: submitData, text: "Submit"),
                ),
                MyBtns(onPressed: cancleData, text: "Cancle"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
