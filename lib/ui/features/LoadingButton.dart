import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:zeder/design_system/design_system.dart';


class LoadingButton extends StatelessWidget {
  final String buttonText;
  final RoundedLoadingButtonController controller;
  final void Function() goNextScreen;
  const LoadingButton({Key? key,
    required this.buttonText,
    required this.goNextScreen,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundedLoadingButton(
      color: DSColors.primary,
      borderRadius: 8,
      onPressed: goNextScreen,
      controller: controller,
      child: SizedBox(
          height: 50,
          width: 250, child: Center(child: DSTextButton(text: buttonText),
        )
      ),
    );
  }
}
