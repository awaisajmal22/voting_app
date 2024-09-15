
  import 'package:flutter/material.dart';
import 'package:votingapp/extensions/size_extension.dart';
import 'package:votingapp/models/cendidate_model.dart';

Widget selectCandidateTile(CandidateModel model, bool isSelected, BuildContext context, VoidCallback onTap) {
    return GestureDetector(
                onTap: onTap,
                child: Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: isSelected
                            ? Colors.blue
                            : Colors.transparent,
                      )),
                  child: Container(
                    height: context.getSize.height * 0.15,
                    width: context.getSize.width * 0.25,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage(
                            model.image),
                          fit: BoxFit.cover,
                        )),
                  ),
                ),
              );
  }