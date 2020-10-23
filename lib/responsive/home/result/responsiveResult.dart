import 'package:flutter/material.dart';



responsiveMainResultContainerWidth(MediaQueryData data){

  double screenWidth = data.size.width;

  if(screenWidth <= 930){
    return data.size.width;
  }else if(screenWidth <= 1000){
    return data.size.width/1.65;
  }else if(screenWidth <= 1200){
    return data.size.width/1.5;
  }else{
    return data.size.width/2.3;
  }
}