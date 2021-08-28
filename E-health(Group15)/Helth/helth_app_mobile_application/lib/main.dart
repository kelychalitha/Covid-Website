import 'package:flutter/material.dart';
import 'package:health_care/firstmenupage.dart';

import 'citi.dart';
import 'citivisit.dart';
import 'firstscreen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
       
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FScreenPage(),
    );
  }
}


