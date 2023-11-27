import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

class ToastHelper {
  ToastHelper(String msg, MaterialColor green, Color white);

  static void showToast({
    required String msg,
    Color? bgColor,
    Color? textColor,
  }) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      backgroundColor: bgColor,
      textColor: textColor ?? Colors.white,
      fontSize: 16.0,
    );
  }
}
