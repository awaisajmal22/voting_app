import 'package:flutter/material.dart';

extension SizedBoxExtension on BuildContext{
  SizedBox  sizedBox({ double h = 0,  double w =0}) => SizedBox(
    height: h,width: w,
  );
}