import 'package:flutter/material.dart';


responsiveMainDealsContainerWidth(MediaQueryData data){

  double screenWidth = data.size.width;

  if(screenWidth <= 1000){
    return data.size.width/3.6;
  }else if(screenWidth < 1200){
    return data.size.width/4;
  }else if(screenWidth <= 1410){
    return data.size.width/4.3;
  }else if(screenWidth <= 1395){
    return data.size.width/3;
  }else{
    return data.size.width/4.6;
  }
}



responsiveDealsItem(MediaQueryData data){

  double screenWidth = data.size.width;

  if(screenWidth <= 1100){
    return 200.0;
  }else if(screenWidth <= 1220){
    return 170.0;
  }else{
    return 150.0;
  }
}