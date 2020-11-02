import 'package:flutter/material.dart';



responseiveHomeSearchContainerHeight(MediaQueryData data) {

  double screenHeight = data.size.height;

  if(screenHeight <= 440){
    return data.size.height/1;
 }else if(screenHeight <= 520){
    return data.size.height/1;
 }else if(screenHeight <= 570){
    return data.size.height/1.1;
 }else if(screenHeight <= 640){
    return data.size.height/1.3;
 }else if(screenHeight <= 710){
    return data.size.height/1.5;
 }else if(screenHeight <= 810){
    return data.size.height/1.8;
  }else if(screenHeight <= 870){
    return data.size.height/2;
  }else if(screenHeight > 870){
    return data.size.height/2.2;
  }
}



responseiveHomeSearchContainerWidth(MediaQueryData data) {

  double screenWidth = data.size.width;

  if(screenWidth <= 690){
    return data.size.width/1.5;
  }else if(screenWidth <= 840){
    return data.size.width/1.7;
  }else if(screenWidth <= 1080){
    return data.size.width/1.9;
  }else if(screenWidth <= 1990){
    return data.size.width/2;
  }else if(screenWidth > 2000){
    return data.size.width/2.5;
  }
}



responseHomeSearchFont(MediaQueryData data){

  double screenWidth = data.size.width;

  if(screenWidth <= 1000){
    return 15.0;
  }else if(screenWidth > 2000){
    return 20.0;
  }
}