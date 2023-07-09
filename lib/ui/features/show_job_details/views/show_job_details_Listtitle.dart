import 'package:flutter/material.dart';
import 'package:zeder/design_system/design_system.dart';

class ShowJobDetaisListtile extends StatelessWidget {
  final String iconName;
  final String title;
  final String chosenOption;

  const ShowJobDetaisListtile({
    Key? key,
    required this.iconName,
    required this.title,
    required this.chosenOption,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return
      Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        color: DSColors.cardColor,
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            minWidth: double.infinity,
            minHeight: 64,
          ),

          child: Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: DSColors.cardColor,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DSIconFilledPrimary(iconName: iconName),
                const SizedBox(width: 8.0),
                Flexible(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 16,
                          color: DSColors.secondary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        chosenOption,
                        style: const TextStyle(
                          fontSize: 16,
                          color: DSColors.secondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
   }
}




/*class ShowJobDetaisListtile extends StatelessWidget {
  final String iconName;
  final String title;
  final String chosenOption;
  const ShowJobDetaisListtile({Key? key, required this.iconName, required this.title, required this.chosenOption}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minWidth: double.infinity,
        minHeight: 100,
        maxHeight: 100,
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        color: DSColors.cardColor,
        child: Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: DSColors.cardColor,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DSIconFilledPrimary(iconName: iconName),
              const SizedBox(width: 8.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontSize: 16, color: DSColors.secondary, fontWeight: FontWeight.bold)),
                  Text(chosenOption, style: const TextStyle(fontSize: 16, color: DSColors.secondary)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}*/