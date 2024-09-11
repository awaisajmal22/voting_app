import 'package:flutter/material.dart';

extension FontSizeExtension on BuildContext{
  double fontSize(double font){
    return MediaQuery.of(this).textScaler.scale(font);
  }
}