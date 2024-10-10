import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:shop/main.dart';

String calculateDiscountedPrice(double price, double discountPercentage) {
  return (price - (price * (discountPercentage / 100))).toStringAsFixed(1);
}

enum MessageType {
  success,
  error,
  warning,
  information,
}

void flashMsg(MessageType msgType, List<String> errors) {
  if (errors.isNotEmpty) {
    final errorMessages = errors.where((error) => error != null).toList();
    if (errorMessages.isNotEmpty) {
      final errorMessage = errorMessages.join('\n');
      final snackBar = SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: msgType == MessageType.success ? 'Voila' : 'On Snap!',
          message: errorMessage,
          contentType: msgType == MessageType.success
              ? ContentType.success
              : ContentType.failure,
        ),
      );

      ScaffoldMessenger.of(navigatorKey.currentContext!)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
      return;
    }
  }
}
