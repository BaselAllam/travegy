import 'package:flutter/material.dart';
import 'package:travegy/screens/mobile/bottomnavbar/bottomnacbar.dart';
import 'package:travegy/screens/web/homepage.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io';

void main() => runApp(MyApp());



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: kIsWeb == true ? WebHomePage() : Platform.isAndroid ? BottomNavBar() : Platform.isIOS ? BottomNavBar() : WebHomePage(),
    );
  }
}