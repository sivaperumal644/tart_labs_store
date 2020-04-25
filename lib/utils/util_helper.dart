import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class Helper {
  static showToast(String message, BuildContext context) {
    Toast.show(
      message,
      context,
      gravity: Toast.BOTTOM,
      duration: Toast.LENGTH_SHORT,
    );
  }
}
