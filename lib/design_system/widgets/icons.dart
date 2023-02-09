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
