import 'package:flutter/material.dart';
import 'package:zeder/design_system/design_system.dart';

class DSCardListTile extends StatelessWidget {
  final Widget leading;
  final Widget title;
  final Widget? subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;
  Color? color;

  DSCardListTile({
    super.key,
    required this.leading,
    required this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
    this.color = DSColors.cardColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color ,
      surfaceTintColor: DSColors.cardColor,
      elevation: 0.0,
      child: ListTile(
        leading: leading,
        title: title,
        subtitle: subtitle,
        trailing: trailing,
        onTap: onTap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
