import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

toastInfo(
    {required String msg,
    Color backgroundColor = Colors.black,
    Color textColor = Colors.white}) {
  return Fluttertoast.showToast(msg: msg);
}