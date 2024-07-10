import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  List toDoList = [];

  //referencing the Hive
  var mybox = Hive.box('mybox');

  //default method(opening for the first time)
  void createInitialData (){
    toDoList = [
      ["Make Breakfast", false],
      ["Have My Bath", false]
    ];
  }

  //method to load data from box database
  void loadData(){
    toDoList = mybox.get("TODOLIST");
  }

  //method to update changes to box database
  void updateDataBase(){
    mybox.put("TODOLIST", toDoList);
  }
}