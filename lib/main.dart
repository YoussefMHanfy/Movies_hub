// @dart=2.9
import 'package:flutter/material.dart';
import 'package:move_hub/modules/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false ,
      theme: ThemeData.dark(),
      home: HomeScreen(),
    );
  }
}


