import 'package:flutter/material.dart';


responseiveHomeHeaderItemFont(MediaQueryData data) {

  double screenWidth = data.size.width;

  if(screenWidth <= 880){
    return 20.0;
  }else if(screenWidth > 880){
    return 25.0;
  }
}


responseiveHomeHeaderSocial(MediaQueryData data) {

  double screenWidth = data.size.width;

  if(screenWidth <= 880){
    return 20.0;
  }else if(screenWidth > 880){
    return 30.0;
  }
}