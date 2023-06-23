import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zeder/design_system/design_system.dart';

class PopUpExplainNameHomeScreen extends StatelessWidget {
  final String title;
  const PopUpExplainNameHomeScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(child: DSTextTitleBoldPrimary(text: title,)),
      actions: [
        Center(
          child: DSButtonSmallPrimary(onPressed:(){
            Navigator.pop(context);
          },
              text: "Ok"),
        )
      ],
    );
  }
}
