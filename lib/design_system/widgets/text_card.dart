import 'package:flutter/material.dart';
import 'package:zeder/design_system/design_system.dart';

class TextCard extends StatelessWidget {
  final String text;
  const TextCard({Key? key,
    required this.text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ConstrainedBox(
        constraints: const BoxConstraints(
          minWidth: double.infinity,
          minHeight: 120,
        maxHeight: 600,
    ),
      child:Card(
        color: DSColors.cardColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
              Radius.circular(12)),
        ),
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: DSTextSubtitleSecondary(
            text: text,
            ),
          ),
        ),
      );
  }
}






