// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:somas_day/Pages/to_do_app.dart';

void main()async {
  //initializing Hive
 await Hive.initFlutter();

 //opening Hive box
 var box = await Hive.openBox('mybox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.yellow, 
        appBarTheme:  AppBarTheme(color: Colors.blue[500], centerTitle: true)
      ),
    );
  }
}