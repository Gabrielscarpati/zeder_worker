import 'package:flutter/material.dart';
import 'package:zeder/design_system/parameters/colors.dart';

class DSAppBar extends StatelessWidget implements PreferredSizeWidget {

  @override
  Size get preferredSize => const Size.fromHeight(80);
  final String title;
  final Widget? action;
  const DSAppBar({Key? key, required this.title, this.action}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        action == null? const SizedBox():
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: action
        ),
      ],
      toolbarHeight: 80,
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () => Navigator.of(context).pop(),
      ),
      backgroundColor: DSColors.scaffoldBackground,
      title: Text(
        title,
        style: const TextStyle(
          color: DSColors.secondary,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
