import 'package:flutter/material.dart';
import 'package:zeder/design_system/design_system.dart';

abstract class DSButtonLarge extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;

  const DSButtonLarge({
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
      child: Container(height: 50, width: 250, child: Center(child: DSTextButton(text: text))),
    );
  }
}

class DSButtonLargePrimary extends DSButtonLarge {
  const DSButtonLargePrimary({super.key, required super.onPressed, required super.text});

  @override
  Color get backgroundColor => DSColors.primary;
}

class DSButtonLargeSecondary extends DSButtonLarge {
  const DSButtonLargeSecondary({super.key, required super.onPressed, required super.text});

  @override
  Color get backgroundColor => DSColors.secondary;
}

class DSButtonLargeTertiary extends DSButtonLarge {
  const DSButtonLargeTertiary({super.key, required super.onPressed, required super.text});

  @override
  Color get backgroundColor => DSColors.tertiary;
}

abstract class DSButtonSmall extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;

  const DSButtonSmall({
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
      child: SizedBox(height: 50, width: 100, child: Center(child: DSTextButton(text: text))),
    );
  }
}

class DSButtonSmallPrimary extends DSButtonSmall {
  const DSButtonSmallPrimary({super.key, required super.onPressed, required super.text});

  @override
  Color get backgroundColor => DSColors.primary;
}

class DSButtonSmallSecondary extends DSButtonSmall {
  const DSButtonSmallSecondary({super.key, required super.onPressed, required super.text});

  @override
  Color get backgroundColor => DSColors.secondary;
}

class DSButtonSmallTertiary extends DSButtonSmall {
  const DSButtonSmallTertiary({super.key, required super.onPressed, required super.text});

  @override
  Color get backgroundColor => DSColors.tertiary;
}

abstract class DSButtonWithIconLarge extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final String iconName;

  const DSButtonWithIconLarge({
    super.key,
    required this.onPressed,
    required this.text,
    required this.iconName,
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
      child: Container(
          height: 50,
          width: 250,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(child: DSTextButton(text: text)),
              DSIconLargeWhite(
                iconName: iconName,
              ),
            ],
          )),
    );
  }
}

class DSButtonWithIconLargePrimary extends DSButtonWithIconLarge {
  const DSButtonWithIconLargePrimary({super.key, required super.onPressed, required super.text, required super.iconName});

  @override
  Color get backgroundColor => DSColors.primary;
}

class DSButtonWithIconLargeSecondary extends DSButtonWithIconLarge {
  const DSButtonWithIconLargeSecondary({super.key, required super.onPressed, required super.text, required super.iconName});

  @override
  Color get backgroundColor => DSColors.secondary;
}

class DSButtonWithIconLargeTertiary extends DSButtonWithIconLarge {
  const DSButtonWithIconLargeTertiary({super.key, required super.onPressed, required super.text, required super.iconName});

  @override
  Color get backgroundColor => DSColors.tertiary;
}
