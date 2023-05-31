import 'package:flutter/material.dart';
import 'package:zeder/design_system/design_system.dart';

class ShowJobDetaisListtile extends StatelessWidget {
  final String iconName;
  final String title;
  final String chosenOption;
  const ShowJobDetaisListtile({Key? key, required this.iconName, required this.title, required this.chosenOption}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: DSColors.cardColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 46,
          width: MediaQuery.of(context).size.width,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DSIconFilledPrimary(iconName: iconName),
              SizedBox(width: 8,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DSTextTitleBoldSecondary(text: title),
                  DSTextTitleSecondary(text: chosenOption),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}