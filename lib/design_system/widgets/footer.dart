import 'package:flutter/material.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';

import '../parameters/colors.dart';

class Footer extends StatefulWidget {
  final Widget header;
  final Widget? body;
  final double? maxHeight;

  const Footer({
    Key? key,
    required this.header,
    this.body,
    this.maxHeight,
  }) : super(key: key);

  @override
  State<Footer> createState() => FooterState();
}

class FooterState extends State<Footer> {
  SolidController controller = SolidController();

  Widget get header => Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: DSColors.cardColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: widget.header);

  Widget get body => Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: DSColors.cardColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: widget.body);

  @override
  Widget build(BuildContext context) {
    return SolidBottomSheet(
      controller: controller,
      headerBar: header,
      maxHeight: widget.body == null ? 1 : (widget.maxHeight ?? 500),
      body: body,
    );
  }
}
