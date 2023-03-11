import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:zeder/design_system/design_system.dart';

import '../../../core/utils/date_utils.dart';

class SelecionarData extends StatefulWidget {
  final String title;
  final Function(DateTime?) onSelectDate;

  const SelecionarData({
    super.key,
    required this.title,
    required this.onSelectDate,
  });

  @override
  _SelecionarDataState createState() => _SelecionarDataState();
}

class _SelecionarDataState extends State<SelecionarData> {
  String date = DateUtil.getExibitionDate(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DSTextTitleBoldSecondary(text: widget.title),
        SizedBox(height: 16),
        InkWell(
          onTap: () {
            showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime.now().add(Duration(days: 365)),
            ).then((value) {
              if (value != null) {
                setState(() {
                  date = DateUtil.getExibitionDate(value);
                });
                widget.onSelectDate(value);
              }
            });
          },
          child: Container(
              decoration: BoxDecoration(
                color: DSColors.cardColor,
                
                borderRadius: BorderRadius.circular(12),
              ),
              height: 60,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  DSTextSubtitleBoldSecondary(text: date),
                  const DSIconLargeSecondary(iconName: 'calendar')
                ],
              )),
        )
      ],
    );
  }
}
