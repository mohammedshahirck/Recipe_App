import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Toasts {
  static Future<void> showToast(
    String msg,
    Color color, [
    Toast toastlength = Toast.LENGTH_SHORT,
  ]) async {
    await Fluttertoast.cancel();
    await Fluttertoast.showToast(
      msg: msg,
      backgroundColor: color,
      toastLength: toastlength,
    );
  }
}
