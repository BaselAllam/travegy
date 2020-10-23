import 'package:flutter/material.dart';
import 'package:travegy/screens/checkHome.dart';

void main() => runApp(MyApp());



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CheckHome(),
    );
  }
}