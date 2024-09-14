import 'package:flutter/material.dart';
import 'package:votingapp/constant/constant.dart';
import 'package:votingapp/models/voter_detail_model.dart';

class HomeController extends ChangeNotifier{
  TextEditingController cnicController = TextEditingController();
  List<VoterDetailModel> votersList = <VoterDetailModel>[
    VoterDetailModel(cnic: '31303-2826322-3', department: 'Computer Science', email: 'awaisajmal22@gmail.com', fname: 'Awais', lname: 'Muhammad Ajmal', image: Constant.logo, mname: 'Ajmal', phone: '+923146800808', smester: '8th'),
    VoterDetailModel(cnic: '71103-1116205-9', department: 'Computer Science', email: 'syedmunib@gmail.com', fname: 'syed', lname: 'munib', image: Constant.logo, mname: '', phone: '+9234675556', smester: '8th')
  ];
}