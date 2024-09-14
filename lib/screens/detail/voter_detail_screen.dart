import 'package:flutter/material.dart';
import 'package:votingapp/extensions/size_extension.dart';
import 'package:votingapp/extensions/sized_box_extension.dart';
import 'package:votingapp/models/voter_detail_model.dart';
import 'package:votingapp/screens/facedetect/face_detect_screen.dart';
import 'package:votingapp/utils/app_text.dart';
import 'package:votingapp/utils/custom_button.dart';
import 'package:votingapp/utils/rich_text.dart';

class VoterDetailScreen extends StatelessWidget {
  VoterDetailModel model;
   VoterDetailScreen({super.key,required this.model});

  @override
  Widget build(BuildContext context) {
    print('Model of Detail Screen ${model.image}');
    return Scaffold(
      body: SafeArea(child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SizedBox(height: context.getSize.height,
          child: Column(
          
            children: [
              context.sizedBox(h: context.getSize.height * 0.04),
              appText(context: context, title: 'Confirm Voter Details',fontSize: 30),
              const Spacer(),
              Container(
                width: context.getSize.width,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20)
                  ,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 0,
                      blurRadius: 40,
                      offset: const Offset(5, 5)
                    ),
          
                  ],
          
                  
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      
                      height: context.getSize.height * 0.2,width: context.getSize.width * 0.4,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(image: AssetImage(model.image!),fit: BoxFit.cover),
                        border: Border.all(
                          color: Colors.green,
                        )
                      ),
                    ),
                    context.sizedBox(
                      h: context.getSize.height * 0.01
                    ),
                    appRichText(context: context, title: 'First Name', subtitle: model.fname ??''),
                    context.sizedBox(
                      h: context.getSize.height * 0.01
                    ),
                    appRichText(context: context, title: 'Middle Name', subtitle: model.mname ??''),
                    context.sizedBox(
                      h: context.getSize.height * 0.01
                    ),
                    appRichText(context: context, title: 'Last Name', subtitle: model.lname ??''),
                    context.sizedBox(
                      h: context.getSize.height * 0.01
                    ),
                    appRichText(context: context, title: 'CNIC', subtitle: model.cnic ??''),
                    context.sizedBox(
                      h: context.getSize.height * 0.01
                    ),
                    appRichText(context: context, title: 'Email', subtitle: model.email ??''),
                    context.sizedBox(
                      h: context.getSize.height * 0.01
                    ),
                    appRichText(context: context, title: 'Phone Number', subtitle: model.phone ??''),
                    context.sizedBox(
                      h: context.getSize.height * 0.01
                    ),
                    appRichText(context: context, title: 'Department', subtitle: model.department ??''),
                    context.sizedBox(
                      h: context.getSize.height * 0.01
                    ),
                    appRichText(context: context, title: 'Semester', subtitle: model.smester ??''),
                  ],
                ),
              ),
              context.sizedBox(h: context.getSize.height * 0.02),
              Padding(padding: const EdgeInsets.symmetric(horizontal: 30),child: customButton(context: context, onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> FaceDetectionScreen()));
              }, title: 'Verify Voter'),),
              const Spacer(),

            ],
          ),
        ),
      )),
    );
  }
}