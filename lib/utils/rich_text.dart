import 'package:flutter/material.dart';
import 'package:votingapp/extensions/font_size_extension.dart';

appRichText({
  required BuildContext context,
  required  String title,
  required String subtitle,
  double titleSize = 16,
  double subtitleSize = 14,
  FontWeight titleWeight = FontWeight.bold,
  FontWeight subtitleWeight = FontWeight.normal,
  Color color = Colors.black,

}){
  return RichText(text: TextSpan(
    text: '$title: ',
    style: TextStyle(
      fontFamily: 'Protest Guerrilla',
      fontSize: context.fontSize(titleSize),
      color: color,
      fontWeight: titleWeight,
    ),
    children: [
      TextSpan(
text: subtitle,
style: TextStyle(
   fontFamily: 'Protest Guerrilla',fontSize: context.fontSize(subtitleSize),
   color: color.withOpacity(0.5),
   fontWeight: subtitleWeight,
)
      )
    ]
  ),);
}