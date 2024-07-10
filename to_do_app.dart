// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:somas_day/Data/database.dart';
import 'package:somas_day/Util/dialog_box.dart';
import 'package:somas_day/Util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //calling Hive box(opening)
   final mybox = Hive.box('mybox'); 

  //controller call
  final controllerCall = TextEditingController();

  //creaing an instance of the Hive class
  ToDoDatabase db = ToDoDatabase();

  @override
  void initState() {
  //if predicate to check if user is opening app for the first time
    if(mybox.get("TODOLIST")== null){

  //first time
      db.createInitialData();

    }else{

  //already opened before
      db.loadData();
    }
  
    super.initState();
  }

  //method to check and uncheck box
  void checkBoxChanged(bool? value, int dex){
    setState(() {
      db.toDoList[dex][1] = !db.toDoList[dex][1];
    });
    //update Hive Database of change
    db.updateDataBase();
  }

  //method for save button
  void saveNewTask (){
    setState(() {
      db.toDoList.add([controllerCall.text, false]);
      controllerCall.clear();
    });
    //to dismiss the dialog box after pressing "save"
    Navigator.of(context).pop();

    //update Hive Database of change
    db.updateDataBase();
  }

   //method for new tasks
   void createNewTask(){
    showDialog(
      context: context,
      builder: (context){
        return DialogBox(
          myController: controllerCall,
          onSave: saveNewTask,

          //"cancel" method to pop the dialog box when "cancel" button is pressed
          onCancel: ()=>{
            Navigator.of(context).pop(),
            controllerCall.clear()
            }
        );
       }
      );
   }

   //method for deleting task
   void deleteTask(int index){
    setState(() {
      db.toDoList.removeAt(index);
    });
     //update Hive Database of change
     db.updateDataBase();
   }

  @override
  Widget build(BuildContext context) {

    //main scaffold
    return Scaffold(
      backgroundColor: Colors.yellow[500],
      appBar: AppBar(
        title: Text(
          "THINGS TO DO",
          style: TextStyle(
            color: Color.fromARGB(255, 247, 237, 144),
            
          ),
          ),
        elevation: 5,
      ),

      //floating action button (+)
      floatingActionButton: FloatingActionButton(
        
        backgroundColor: Colors.blue[600],
        onPressed: createNewTask,
        child: Icon(Icons.add, color: Color.fromARGB(255, 247, 237, 144),),
      ),

      //main to do list tile
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index){

          //"TodoTile" class defined in todo_tile.dart
          return TodoTile(
            taskName: db.toDoList[index][0], 
            taskCompleted: db.toDoList[index][1], 
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
            );
          },
        )
    );
  }
}