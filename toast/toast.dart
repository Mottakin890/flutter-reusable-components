import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// show toast message without any context
showToast(String text) {
  Fluttertoast.cancel();
  Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.black,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}