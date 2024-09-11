import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:votingapp/constant/constant.dart';
import 'package:votingapp/controller/home_controller.dart';
import 'package:votingapp/extensions/size_extension.dart';
import 'package:votingapp/utils/background.dart';
import 'package:votingapp/utils/custom_button.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});
final border =  OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                      );
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(
      builder: (context, controller, _) {
        return Scaffold(
          body:background(
           
          context: context,bgImage: Constant.logo,
              
            
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                      TextFormField(
                        keyboardType: TextInputType.number,
                        inputFormatters:[
                          CnicFormatter(),
                          LengthLimitingTextInputFormatter(15)
                        ] ,
                        controller: controller.cnicController,
                        decoration: InputDecoration(
              hintText: 'Enter Your CNIC..',
                      border: border,
                      
                      errorBorder:border,
                      enabledBorder:border,focusedBorder: border,
                      disabledBorder: border,
                      focusedErrorBorder: border,
                        ),
                      ),
              
                      SizedBox(
                        height: context.getSize.height * 0.01,
                      ),
                      customButton(context: context, onTap: (){}, title: 'Submit')
                ],
              ),
            ),
          )
        );
      }
    );
  }
}

class CnicFormatter extends TextInputFormatter{
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
 String newText = newValue.text;
 newText = newText.replaceAll(RegExp(r'[^0-9]'), '');
 if(newText.length >=6){
  newText = newText.substring(0,5) + '-' + newText.substring(5);

 }if(newText.length >= 13){
  newText = newText.substring(0, 13) + '-' + newText.substring(13);

 }
 return TextEditingValue(
  text: newText,
  selection: TextSelection.collapsed(offset: newText.length)
 );
  }
  
}