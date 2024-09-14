import 'package:flutter/material.dart';
import 'package:votingapp/constant/constant.dart';
import 'package:votingapp/extensions/size_extension.dart';
import 'package:votingapp/routes/app_routes.dart';
import 'package:votingapp/utils/background.dart';
import 'package:votingapp/utils/custom_button.dart';

class ChooserScreen extends StatelessWidget {
  const ChooserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: background(context: context, bgImage: Constant.logo,child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
          children: [
        customButton(context: context, onTap: (){
          Navigator.pushNamed(context, AppRoutes.results);
        }, title: 'Result'),
        SizedBox(height: context.getSize.height * 0.01,),customButton(context: context, onTap: (){
          Navigator.pushNamed(context, AppRoutes.home);
        }, title: 'Vote'),

          ],
        ),
      )),
    );
  }
}