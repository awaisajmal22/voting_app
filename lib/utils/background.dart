import 'package:flutter/material.dart';
import 'package:votingapp/extensions/size_extension.dart';

background({required BuildContext context, required String bgImage,required Widget child}){
  return Container(
    height: context.getSize.height,width: context.getSize.width,
    decoration: BoxDecoration(
      image: DecorationImage(image: AssetImage(bgImage),fit: BoxFit.cover)
    ),
    child: child,
  );
}