import 'package:flutter/material.dart';
import 'package:zeder/design_system/design_system.dart';

abstract class DSButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;

  const DSButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  Color get backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
      ),
      child: DSTextButton(text: text),
    );
  }
}

class DSButtonPrimary extends DSButton {
  const DSButtonPrimary({super.key, required super.onPressed, required super.text});

  @override
  Color get backgroundColor => DSColors.primary;
}

class DSButtonSecondary extends DSButton {
  const DSButtonSecondary({super.key, required super.onPressed, required super.text});

  @override
  Color get backgroundColor => DSColors.secondary;
}

class DSButtonTertiary extends DSButton {
  const DSButtonTertiary({super.key, required super.onPressed, required super.text});

  @override
  Color get backgroundColor => DSColors.tertiary;
}
