// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  //define each component that a task tile needs
  final String taskName;
  final bool taskCompleted;

  //for checkbox
  Function(bool?)? onChanged;

  //for delete function in slidable
  Function(BuildContext)? deleteFunction;


  //Class Begins
  TodoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
      child: Slidable(

        //for slide animation
        endActionPane: ActionPane(
          motion: StretchMotion(), 
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Color.fromARGB(255, 242, 104, 104),
              borderRadius: BorderRadius.circular(12),
              )
           ],
          ),

        //to do contents in container
        child: Container(
          padding: EdgeInsets.all(25),
          decoration: BoxDecoration(
            color: Colors.yellow[800],
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(12)
          ),
          child: Row(
            children: [
        
              //Checkbox
              Checkbox(
                value: taskCompleted, onChanged: onChanged,
                activeColor: Colors.black,
              ),
        
              //Task Message
              Text(
                taskName,
                style: (
                  TextStyle(
                    decoration: taskCompleted 
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
                    fontSize: 20
                    )
                  ),
              ),
            ],
          ), 
        ),
      )
    );
  }
}