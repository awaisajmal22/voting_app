import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:votingapp/constant/constant.dart';
import 'package:votingapp/controller/splash_controller.dart';
import 'package:votingapp/extensions/size_extension.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<SplashController>(context,listen: false).nextScreen(context: context);
    return Scaffold(
        body:Center(child: Image.asset(Constant.logo, height: context.getSize.height,width: context.getSize.width,fit: BoxFit.contain,),)
    );
  }
}