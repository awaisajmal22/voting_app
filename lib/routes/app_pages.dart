import 'package:flutter/material.dart';
import 'package:votingapp/routes/app_routes.dart';
import 'package:votingapp/screens/chooser/chooser_screen.dart';
import 'package:votingapp/screens/home/home_screen.dart';
import 'package:votingapp/screens/splash/splash_screen.dart';

class AppPages{
  static Route<dynamic> onGenerateRoute(RouteSettings setting){
    switch(setting.name){
      case AppRoutes.splash: return MaterialPageRoute(builder: (context)=> SplashScreen());
      case AppRoutes.home: return MaterialPageRoute(builder: (context)=> HomeScreen());
      case AppRoutes.chooser: return MaterialPageRoute(builder: (context)=> ChooserScreen());
      default: return _errorRoute();
    }
    
    
  }
 static Route<dynamic> _errorRoute(){
    return MaterialPageRoute(builder: (context){
      return Scaffold(
        body: Center(
          child: Text("Error Route"),
        ),
      );
    });
  }
}