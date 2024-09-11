import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:votingapp/controller/home_controller.dart';
import 'package:votingapp/controller/splash_controller.dart';
import 'package:votingapp/routes/app_pages.dart';
import 'package:votingapp/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => SplashController()),
      ChangeNotifierProvider(create: (_) => HomeController())
    ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
         
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      initialRoute: AppRoutes.splash,
      onGenerateRoute: AppPages.onGenerateRoute,
      ),
    );
  }
}
