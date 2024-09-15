import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:votingapp/controller/select_candidate_controller.dart';
import 'package:votingapp/extensions/size_extension.dart';
import 'package:votingapp/extensions/sized_box_extension.dart';
import 'package:votingapp/extensions/toast_extension.dart';
import 'package:votingapp/models/cendidate_model.dart';
import 'package:votingapp/routes/app_routes.dart';
import 'package:votingapp/screens/select_candidate/component/selected_candidate_tile.dart';
import 'package:votingapp/utils/app_text.dart';
import 'package:votingapp/utils/custom_button.dart';

class SelectCandidateScreen extends StatelessWidget {
  const SelectCandidateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          Consumer<SelectCandidateController>(builder: (context, provider, __) {
        return SafeArea(
            child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            context.sizedBox(
              h: context.getSize.height * 0.04,
            ),
            appText(
              context: context,
              title: 'Select Your Candidates',
              fontSize: 24,
            ),
            context.sizedBox(
              h: context.getSize.height * 0.025,
            ),
            appText(
              context: context,
              title: 'President',
              fontSize: 18,
            ),
            context.sizedBox(
              h: context.getSize.height * 0.01,
            ),
            Wrap(
              spacing: 10,
              runAlignment: WrapAlignment.start,
              alignment: WrapAlignment.start,
              runSpacing: 10,
              children: List.generate(provider.presidentCandidateList.length,
                  (index) {
                return selectCandidateTile(
                    provider.presidentCandidateList[index],
                    provider.selectedPresidentIndex == index ? true : false,
                    context, () {
                  provider.changePresidentIndex(index);
                });
              }),
            ),
            context.sizedBox(
              h: context.getSize.height * 0.025,
            ),
            appText(
              context: context,
              title: 'Vice President',
              fontSize: 18,
            ),
            context.sizedBox(
              h: context.getSize.height * 0.01,
            ),
            Wrap(
              spacing: 10,
              runAlignment: WrapAlignment.start,
              alignment: WrapAlignment.start,
              runSpacing: 10,
              children: List.generate(provider.visPresidentCandidateList.length,
                  (index) {
                return selectCandidateTile(
                    provider.visPresidentCandidateList[index],
                    provider.selectedVicePresidentIndex == index ? true : false,
                    context, () {
                  provider.changeVicePresidentIndex(index);
                });
              }),
            ),
            context.sizedBox(
              h: context.getSize.height * 0.3,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: customButton(
                  context: context,
                  onTap: () {
                    context.showToast(title: 'Vote Submit Successfully..');
                    Navigator.pushReplacementNamed(context, AppRoutes.chooser);
                  },
                  title: 'Submit Vote'),
            ),
          ],
        ));
      }),
    );
  }
}
