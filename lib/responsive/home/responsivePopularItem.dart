import 'package:flutter/material.dart';




responseiveHomePopularContainerWidth(MediaQueryData data) {

  double screenWidth = data.size.width;

  if(screenWidth <= 690){
    return data.size.width/2;
  }else if(screenWidth <= 840){
    return data.size.width/1.7;
  }else if(screenWidth <= 1000){
    return data.size.width/1.5;
  }else if(screenWidth <= 1310){
    return data.size.width/1.6;
  }else if(screenWidth <= 1380){
    return data.size.width/1.5;
  }else if(screenWidth <= 1450){
    return data.size.width/1.65;
  }else if(screenWidth <= 1850){
    return data.size.width/1.7;
  }else if(screenWidth <= 1950){
    return data.size.width/1.3;
  }else if(screenWidth > 2000){
    return data.size.width/1.1;
  }
}


responseiveHomePopularItemContainerWidth(MediaQueryData data) {

  double screenWidth = data.size.width;

  if(screenWidth <= 800){
    return data.size.width/2.5;
  }else if(screenWidth <= 1000){
    return data.size.width/2.5;
  }else if(screenWidth <= 1380){
    return data.size.width/3;
  }else if(screenWidth <= 1430){
    return data.size.width/4.5;
  }else if(screenWidth <= 1950){
    return data.size.width/3.5;
  }else if(screenWidth > 2000){
    return data.size.width/3.5;
  }
}



responseHomePopularFont(MediaQueryData data){

  double screenWidth = data.size.width;

  if(screenWidth <= 1000){
    return 25.0;
  }else if(screenWidth <= 1300){
    return 35.0;
  }else{
    return 55.0;
  }
}



responseHomeCityOfTheDayFont(MediaQueryData data){

  double screenWidth = data.size.width;

  if(screenWidth <= 1000){
    return 35.0;
  }else if(screenWidth <= 1300){
    return 55.0;
  }else{
    return 95.0;
  }
}