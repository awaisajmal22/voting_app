import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:votingapp/constant/constant.dart';
import 'package:votingapp/controller/results_controller.dart';
import 'package:votingapp/extensions/font_size_extension.dart';
import 'package:votingapp/extensions/size_extension.dart';
import 'package:votingapp/models/cendidate_model.dart';
import 'package:votingapp/screens/results/component/reesult_tile.dart';
import 'package:votingapp/utils/app_text.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ResultsController>(
        builder: (context, provider,__) {
          return SafeArea(child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: context.getSize.height * 0.04,
                ),
                   FittedBox(
                child:    appText(context: context, title: 'Voting Results for Test Election 2', fontSize:  30, fontWeight: FontWeight.w500,),),
             SizedBox(
                height: context.getSize.height * 0.02,
               ),
             appText(context: context, title: 'Total Voters: 4',fontSize: 18,),
             
           SizedBox(
                height: context.getSize.height * 0.01,
               ),
               appText(context: context, title: 'Voters Participated: 1',fontSize: 18,),
                 SizedBox(
                height: context.getSize.height * 0.02,
               ),
                 appText(context: context, title: 'President',fontSize: 16,color: Colors.blue),
                SizedBox(
                height: context.getSize.height * 0.01,
               ), 
                 appText(context: context, title: 'Total Votes Cast: 1',fontSize: 16,),
                 SizedBox(
                height: context.getSize.height * 0.01,
               ), 
               Wrap(
                spacing: 10,runSpacing: 10,
                alignment: WrapAlignment.start,
                children:List.generate(provider.presidentCandidateList.length, (index){
                 int maxVotes = provider.presidentCandidateList.map((candidate) => candidate.votes).reduce((a, b) => a > b ? a : b);

  List<bool> isWinner = provider.presidentCandidateList.map((candidate) => candidate.votes == maxVotes).toList();
                  return resultTile(context, provider.presidentCandidateList[index], isWinner[index]);
                })
               ),
                 SizedBox(
                height: context.getSize.height * 0.02,
               ),
                 appText(context: context, title: 'Vice President',fontSize: 16,color: Colors.blue),
                SizedBox(
                height: context.getSize.height * 0.01,
               ), 
                 appText(context: context, title: 'Total Votes Cast: 1',fontSize: 16,),
                 SizedBox(
                height: context.getSize.height * 0.01,
               ), 
               Wrap(
                spacing: 10,runSpacing: 10,
                alignment: WrapAlignment.start,
                children:List.generate(provider.visPresidentCandidateList.length, (index){
                 int maxVotes = provider.visPresidentCandidateList.map((candidate) => candidate.votes).reduce((a, b) => a > b ? a : b);

  List<bool> isWinner = provider.visPresidentCandidateList.map((candidate) => candidate.votes == maxVotes).toList();
                  return resultTile(context, provider.visPresidentCandidateList[index], isWinner[index]);
                })
               )
              ],
            ),
          ));
        }
      ),
    );
  }

}