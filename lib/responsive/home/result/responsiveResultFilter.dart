import 'package:flutter/material.dart';



responsiveMainFilterContainerWidth(MediaQueryData data){

  double screenWidth = data.size.width;

  if(screenWidth <= 1410){
    return data.size.width/4.3;
  }else if(screenWidth <= 1395){
    return data.size.width/3;
  }else{
    return data.size.width/4.6;
  }
}