import 'package:flutter/cupertino.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../parameters/colors.dart';

class DSIconFilledPrimary extends _DSIconFilled {
  const DSIconFilledPrimary({super.key, required super.iconName});

  @override
  Color get color => DSColors.primary;
}

class DSIconFilledSecondary extends _DSIconFilled {
  const DSIconFilledSecondary({super.key, required super.iconName});

  @override
  Color get color => DSColors.secondary;
}

class DSIconFilledTertiary extends _DSIconFilled {
  const DSIconFilledTertiary({super.key, required super.iconName});

  @override
  Color get color => DSColors.tertiary;
}

class DSIconFilledPrimaryLarge extends _DSIconFilledLarge {
  const DSIconFilledPrimaryLarge({super.key, required super.iconName});

  @override
  Color get color => DSColors.primary;
}

class DSIconFilledSecondaryLarge extends _DSIconFilledLarge {
  const DSIconFilledSecondaryLarge({super.key, required super.iconName});

  @override
  Color get color => DSColors.secondary;
}

class DSIconFilledTertiaryLarge extends _DSIconFilledLarge {
  const DSIconFilledTertiaryLarge({super.key, required super.iconName});

  @override
  Color get color => DSColors.tertiary;
}

class DSIconPrimary extends _DSIcon {
  const DSIconPrimary({super.key, required super.iconName});

  @override
  Color get color => DSColors.primary;
}

class DSIconSecondary extends _DSIcon {
  const DSIconSecondary({super.key, required super.iconName});

  @override
  Color get color => DSColors.secondary;
}

class DSIconTertiary extends _DSIcon {
  const DSIconTertiary({super.key, required super.iconName});

  @override
  Color get color => DSColors.tertiary;
}

class DSIconSmallPrimary extends _DSIconSmall {
  const DSIconSmallPrimary({super.key, required super.iconName});

  @override
  Color get color => DSColors.primary;
}

class DSIconSmallSecondary extends _DSIconSmall {
  const DSIconSmallSecondary({super.key, required super.iconName});

  @override
  Color get color => DSColors.secondary;
}

class DSIconSmallTertiary extends _DSIconSmall {
  const DSIconSmallTertiary({super.key, required super.iconName});

  @override
  Color get color => DSColors.tertiary;
}

class DSIconLargePrimary extends _DSIconLarge {
  const DSIconLargePrimary({super.key, required super.iconName});

  @override
  Color get color => DSColors.primary;
}

class DSIconLargeSecondary extends _DSIconLarge {
  const DSIconLargeSecondary({super.key, required super.iconName});

  @override
  Color get color => DSColors.secondary;
}

class DSIconLargeTertiary extends _DSIconLarge {
  const DSIconLargeTertiary({super.key, required super.iconName});

  @override
  Color get color => DSColors.tertiary;
}

class DSIconLargeWhite extends _DSIconLarge {
  const DSIconLargeWhite({super.key, required super.iconName});

  @override
  Color get color => DSColors.iconColor;
}

/// abstract classes

abstract class _DSIconFilled extends StatelessWidget {
  const _DSIconFilled({super.key, required this.iconName});

  final String iconName;
  Color get color;

  IconData get icon => MdiIcons.fromString(iconName) ?? MdiIcons.exclamation;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      width: 40.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: DSColors.secondary,
      ),
      child: Icon(icon, color: DSColors.iconColor),
    );
  }
}


abstract class _DSIconFilledLarge extends StatelessWidget {
  const _DSIconFilledLarge({super.key, required this.iconName});

  final String iconName;
  Color get color;

  IconData get icon => MdiIcons.fromString(iconName) ?? MdiIcons.exclamation;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      width: 60.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: DSColors.secondary,
      ),
      child: Icon(icon, color: DSColors.iconColor, size: 40,),
    );
  }
}


abstract class _DSIcon extends StatelessWidget {
  const _DSIcon({super.key, required this.iconName});

  final String iconName;
  Color get color;

  IconData get icon => MdiIcons.fromString(iconName) ?? MdiIcons.exclamation;

  double get size => 40.0;

  @override
  Widget build(BuildContext context) {
    return Icon(icon, color: color, size: size);
  }
}

abstract class _DSIconSmall extends _DSIcon {
  const _DSIconSmall({super.key, required super.iconName});

  @override
  double get size => 24.0;
}

abstract class _DSIconLarge extends _DSIcon {
  const _DSIconLarge({super.key, required super.iconName});

  @override
  double get size => 40.0;
}

