import 'package:flutter/material.dart';
import 'package:votingapp/extensions/font_size_extension.dart';
import 'package:votingapp/extensions/size_extension.dart';
typedef OnTap = Function();
customButton({
  required BuildContext context,
  required OnTap onTap,
  required String title,
   Color color = Colors.transparent,
   Color textColor = Colors.black,
   double fontSize = 16,

   FontWeight fontWeight = FontWeight.w500,
}){
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      alignment: Alignment.center,
      width: context.getSize.width,
      decoration: BoxDecoration(
        color: color,
    
        border: Border.all(
          color: Colors.black,
        ),borderRadius: BorderRadius.circular(20)
      ),
      child: Text(title,style: TextStyle(
        color: textColor,
        fontSize: context.fontSize(fontSize),
        fontWeight: fontWeight,
      )),
    ),
  );
}