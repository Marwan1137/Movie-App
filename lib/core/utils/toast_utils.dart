import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';

@injectable
class ToastUtils {
  // Show success toast with green background
  Future<void> showSuccessToast(String message) async {
    await Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
    );
  }

  // Show error toast with red background
  Future<void> showErrorToast(String message) async {
    await Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
    );
  }

  // Show info toast with blue background
  Future<void> showInfoToast(String message) async {
    await Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.blue,
      textColor: Colors.white,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
    );
  }
}
