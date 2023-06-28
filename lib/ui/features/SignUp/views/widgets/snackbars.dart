import 'package:flutter/material.dart';
import '../../../../../design_system/parameters/colors.dart';

class ShowSnackBar  {
  int? durationInSeconds;
  BuildContext context;
  Color? color;

  ShowSnackBar({required this.context, this.color, this.durationInSeconds});

  void showSnackBar({required String message, Color backgroundColor = Colors.green}) {

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: backgroundColor,
      duration: durationInSeconds == null? const Duration(seconds: 5):  Duration(seconds: durationInSeconds!),
      behavior: SnackBarBehavior.floating,
    )
    );
  }

  void showErrorSnackBar({required String message, Color? color, int? durationInSeconds}) {
    showSnackBar(message: message, backgroundColor: color?? DSColors.warningColor,);
  }
}