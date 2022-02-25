import 'package:flutter/material.dart';
import 'HomePage.dart';
void main()=> runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'XoX-GaMe',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      primaryColor: Colors.blue,
      backgroundColor: Colors.blueAccent,      
      ),
      home: Homepage(),
    );
  }
}