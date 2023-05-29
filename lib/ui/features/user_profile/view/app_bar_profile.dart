import 'package:flutter/material.dart';
import 'package:zeder/design_system/design_system.dart';

class AppBarProfile extends StatefulWidget {
  final String title;
  final void Function() onTap;

  const AppBarProfile({
    Key? key, required this.title,
    required this.onTap
  }) : super(key: key);

  @override
  State<AppBarProfile> createState() => _AppBarProfileState();
}

class _AppBarProfileState extends State<AppBarProfile> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent, // Set the background color to transparent
      elevation: 0, // Remove the shadow
      leading: IconButton(
        icon: const DSIconSecondary( iconName: 'chevron-left',),
        onPressed: widget.onTap,
      ),
      title:  DSTextTitlePrimary(
        text: widget.title,
      ),
      centerTitle: true, // Center the title
    );
  }
}
