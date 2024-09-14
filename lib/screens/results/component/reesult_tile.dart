
  import 'package:flutter/material.dart';
import 'package:votingapp/extensions/font_size_extension.dart';
import 'package:votingapp/extensions/size_extension.dart';
import 'package:votingapp/models/cendidate_model.dart';
import 'package:votingapp/utils/app_text.dart';

Widget resultTile(BuildContext context, CandidateModel model, bool isWinner ) {
    return Container(
              padding: const EdgeInsets.all(10),
               decoration:  BoxDecoration(
                color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  offset: const Offset(5, 5),
                  blurRadius: 40,spreadRadius: 0,
                )
              ]
            ),
            child: Column(
              children: [
                CircleAvatar(
                  radius: context.getSize.width * 0.1,
                  backgroundImage: NetworkImage(model.image),
                ),
                SizedBox(
                  height: context.getSize.height * 0.01,
                ),
                appText(context: context, title: model.name),
                 SizedBox(
                  height: context.getSize.height * 0.01,
                ),
                RichText(text: TextSpan(
                  text: 'Votes: ',
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.8),
                    fontFamily: 'Protest Guerrilla',fontSize: context.fontSize(14),fontWeight: FontWeight.w400,
                  ),
                  children: [
                    TextSpan(
                      text: model.votes.toString(),
                      style: TextStyle(
                    fontFamily: 'Protest Guerrilla',fontSize: context.fontSize(14),fontWeight: FontWeight.w400,
                  ),

                    ),
                    
                  ]
                )), SizedBox(
                  height: context.getSize.height * 0.01,
                ),
              
                appText(context: context, title:  isWinner ? 'Winner' : model.votes > 0 ? 'Runner Up' : 'No Vote', color:isWinner ? Colors.green : Colors.black.withOpacity(0.8))
              ],
            ),
            );
  }