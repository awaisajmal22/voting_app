import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:votingapp/routes/app_routes.dart';

class SplashController extends ChangeNotifier{
  void nextScreen({required BuildContext context}){
    Future.delayed(const Duration(seconds: 3),(){
      Navigator.pushReplacementNamed(context, AppRoutes.chooser);
    });
  }
}