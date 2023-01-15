import 'package:flutter/material.dart';

class AppSnackBar {
  static getSnackBar(String snackBarTitle, BuildContext context) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();

    var snackBar = SnackBar(
      duration: Duration(seconds: 8),
      content: Text(snackBarTitle),
      action: SnackBarAction(
        label: '',
        onPressed: () {},
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}