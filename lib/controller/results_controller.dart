import 'package:flutter/material.dart';
import 'package:votingapp/constant/constant.dart';
import 'package:votingapp/models/cendidate_model.dart';

class ResultsController extends ChangeNotifier{
  List<CandidateModel> presidentCandidateList = <CandidateModel>[
    CandidateModel(name: 'Ali', votes: 5, image: Constant.logo),
     CandidateModel(name: 'Syed Ali', votes: 2, image: Constant.logo),
      CandidateModel(name: 'Kacho', votes: 0, image: Constant.logo),
  ];
   List<CandidateModel> visPresidentCandidateList = <CandidateModel>[
    CandidateModel(name: 'Javed', votes: 1, image: Constant.logo),
     CandidateModel(name: 'Hassu', votes: 0, image: Constant.logo),

  ];
}