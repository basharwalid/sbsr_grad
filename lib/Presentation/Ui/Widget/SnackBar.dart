import 'package:flutter/material.dart';
import 'package:sbsr_grad/Core/Theme/Theme.dart';

class SnackbarService {

  static void showSnackbar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
      width: double.infinity,
      duration: Duration(seconds: 3),
      backgroundColor: MyTheme.green,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}