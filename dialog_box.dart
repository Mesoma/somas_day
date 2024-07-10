// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, prefer_typing_uninitialized_variables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:somas_day/Util/button.dart';

class DialogBox extends StatelessWidget {

  // controller for save and cancel call and method
  final myController;
  VoidCallback onSave;
  VoidCallback onCancel;


  DialogBox({
    super.key, 
    required this.myController,
    required this.onCancel,
    required this.onSave
    });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
        TextField(
          controller: myController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: "Add New Task",
          ),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
          //save button
          MyButton(text: "Save", onPressed: onSave),

          //box to separate them
          const SizedBox(width: 55,),

          //cancel button
          MyButton(text: "Cancel", onPressed: onCancel)
        ],)
      ],)
        ),
    );
  }
}