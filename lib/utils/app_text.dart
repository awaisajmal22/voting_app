import 'package:flutter/material.dart';
import 'package:votingapp/extensions/font_size_extension.dart';

appText({required BuildContext context, required String title,Color color = Colors.black,  double fontSize = 14, FontWeight fontWeight= FontWeight.w400,}){
  return Text(title, style:TextStyle(
    fontSize: context.fontSize(fontSize),
    fontWeight: fontWeight,
    color: color,
    fontFamily: 'Protest Guerrilla',
  ));
}