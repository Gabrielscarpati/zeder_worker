import 'package:flutter/cupertino.dart';
import 'package:zeder/design_system/widgets/text.dart';

class DSLabelText extends StatelessWidget {
  const DSLabelText({
    super.key,
    required this.label,
    required this.text,
    this.height = 60,
  });
  final String label;
  final String text;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DSTextTitleBoldSecondary(text: label),
        SizedBox(
          height: height,
          child: SingleChildScrollView(child: DSTextSubtitleSecondary(text: text)),
        ),
      ],
    );
  }
}
