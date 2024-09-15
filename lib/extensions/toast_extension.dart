import 'package:flutter/material.dart';
import 'package:votingapp/utils/app_text.dart';

extension ToastExtension on BuildContext{
    showToast({required String title, Color bgColor = Colors.black}) => ScaffoldMessenger.of(this).showSnackBar(SnackBar(
      backgroundColor: bgColor,
      content: appText(context: this, title: title, fontSize: 14, color: Colors.white)));
}