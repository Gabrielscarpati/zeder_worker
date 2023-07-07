import 'package:flutter/material.dart';
import 'package:zeder/design_system/design_system.dart';

class DSCardListTileHorizontal extends StatelessWidget {
  final Widget leading;
  final Widget title;
  final Widget? subtitle;
  final Widget trailing;
  final VoidCallback? onTap;
  final Color? color;
  final bool? includeTrailing;

  const DSCardListTileHorizontal({
    super.key,
    required this.leading,
    required this.title,
    this.subtitle,
    required this.trailing,
    this.onTap,
    this.color = DSColors.cardColor,
    this.includeTrailing,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      surfaceTintColor: DSColors.cardColor,
      elevation: 0.0,
      child: ListTile(
        contentPadding: EdgeInsetsGeometry.lerp(
          EdgeInsets.zero,
          const EdgeInsets.symmetric(horizontal: 12),
          0.5,
        ),
        leading: leading,
        title: title,
        subtitle: subtitle,
        trailing: includeTrailing == true? SizedBox(
            width: 108,
            child: trailing
        ):
        SizedBox(width: 4,),
        onTap: onTap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}

class DSCardListTileVertical extends StatelessWidget {
  final Widget header;
  final Widget icon;
  final Widget title;
  final Widget footer;
  final VoidCallback onTap;
  final Color? color;

  const DSCardListTileVertical({
    super.key,
    required this.header,
    required this.title,
    required this.icon,
    required this.footer,
    required this.onTap,
    this.color = DSColors.cardColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Card(
          color: color,
          surfaceTintColor: DSColors.cardColor,
          elevation: 0.0,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                header,
                icon,
                title,
                footer,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
