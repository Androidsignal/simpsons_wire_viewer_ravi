import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Utils {
  static void dismissKeyboard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  static String getExceptionMessage({String? message, dynamic error}) {
    String finalMessage = message ?? 'Something went wrong!';

    if (error != null) {
      if (error is PlatformException) {
        if (error.message != null) {
          finalMessage = error.message!;
        }
      }
    }

    return finalMessage;
  }

  static void showSnackBar(
      {required BuildContext context, required String msg}) {
    final snackBar = SnackBar(content: Text(msg));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
