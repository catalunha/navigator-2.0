import 'package:flutter/material.dart';

import '../../core/config.dart';

mixin AppMessages {
  void showMessageError(BuildContext context, String msg) {
    _showMessage(context, msg, AppColors.red);
  }

  void showMessageInfo(BuildContext context, String msg) {
    _showMessage(context, msg, AppColors.blue);
  }

  void _showMessage(BuildContext context, String msg, Color color) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(
            msg,
            style: const TextStyle(color: AppColors.black),
          ),
          elevation: 10,
          behavior: SnackBarBehavior.floating,
          backgroundColor: color,
        ),
      );
  }
}
