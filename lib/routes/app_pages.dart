import 'package:flutter/material.dart';
import 'package:votingapp/models/voter_detail_model.dart';
import 'package:votingapp/routes/app_routes.dart';
import 'package:votingapp/screens/chooser/chooser_screen.dart';
import 'package:votingapp/screens/detail/voter_detail_screen.dart';
import 'package:votingapp/screens/home/home_screen.dart';
import 'package:votingapp/screens/results/results_screen.dart';
import 'package:votingapp/screens/select_candidate/select_candidate_screen.dart';
import 'package:votingapp/screens/splash/splash_screen.dart';

class AppPages{
  static Route<dynamic> onGenerateRoute(RouteSettings setting){
    switch(setting.name){
      case AppRoutes.splash: return MaterialPageRoute(builder: (context)=> const SplashScreen());
      case AppRoutes.home: return MaterialPageRoute(builder: (context)=> HomeScreen());
      case AppRoutes.chooser: return MaterialPageRoute(builder: (context)=> const ChooserScreen());
      case AppRoutes.results: return MaterialPageRoute(builder: (context)=> const ResultsScreen());
      case AppRoutes.selectCandidate: return MaterialPageRoute(builder: (context)=> const SelectCandidateScreen());
      case AppRoutes.voterDetail: return MaterialPageRoute(builder: (context){
      VoterDetailModel arguments = setting.arguments as VoterDetailModel;
        return VoterDetailScreen(model: arguments);
      });
      default: return _errorRoute();
    }
    
    
  }
 static Route<dynamic> _errorRoute(){
    return MaterialPageRoute(builder: (context){
      return const Scaffold(
        body: Center(
          child: Text("Error Route"),
        ),
      );
    });
  }
}