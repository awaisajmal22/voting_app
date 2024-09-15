import 'package:flutter/material.dart';
import 'package:votingapp/constant/constant.dart';
import 'package:votingapp/models/cendidate_model.dart';

class SelectCandidateController extends ChangeNotifier {
  List<CandidateModel> presidentCandidateList = <CandidateModel>[
    CandidateModel(name: 'Ali', votes: 5, image: Constant.logo),
    CandidateModel(name: 'Syed Ali', votes: 2, image: Constant.logo),
    CandidateModel(name: 'Kacho', votes: 0, image: Constant.logo),
  ];
  List<CandidateModel> visPresidentCandidateList = <CandidateModel>[
    CandidateModel(name: 'Javed', votes: 1, image: Constant.logo),
    CandidateModel(name: 'Hassu', votes: 0, image: Constant.logo),
  ];

  int _selectedPresidentIndex = -1;
  int get selectedPresidentIndex => _selectedPresidentIndex;
  changePresidentIndex(int index) {
    _selectedPresidentIndex = index;
    notifyListeners();
  }

  int _selectedVicePresidentIndex = -1;
  int get selectedVicePresidentIndex => _selectedVicePresidentIndex;
  changeVicePresidentIndex(int index) {
    _selectedVicePresidentIndex = index;
    notifyListeners();
  }
}
