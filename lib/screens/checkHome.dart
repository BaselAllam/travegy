import 'package:flutter/material.dart';
import 'package:travegy/screens/mobile/bottomnavbar/bottomnacbar.dart';
import 'package:travegy/screens/web/homepage.dart';




class CheckHome extends StatefulWidget {
  @override
  _CheckHomeState createState() => _CheckHomeState();
}

class _CheckHomeState extends State<CheckHome> {
  @override
  Widget build(BuildContext context) {
     var data = MediaQuery.of(context);
    if(data.size.width < 700){
      return BottomNavBar();
    }else{
      return WebHomePage();
    }
  }
}