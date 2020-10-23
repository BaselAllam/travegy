import 'package:flutter/material.dart';




responseiveHomeEnderItemWidth(MediaQueryData data) {

  double screenWidth = data.size.width;

    if(screenWidth <= 650){
      return data.size.width/8;
  }else if(screenWidth <= 1000){
    return data.size.width/4;
  }else{
    return data.size.width/6;
  }
}


responseiveHomeEnderItemHeight(MediaQueryData data) {

  double screenHeight = data.size.height;

  if(screenHeight <= 1000){
    return data.size.height/2.3;
  }else{
    return data.size.height/2;
  }
}