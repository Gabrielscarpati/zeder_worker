import 'package:flutter/material.dart';
import '../parameters/colors.dart';

class DSPopUp extends StatelessWidget {
  final String title;
  final Function()? onPressedYes;
  final Function()? onPressedNo;
  const DSPopUp({Key? key,
    required this.title,
    this.onPressedYes,
    this.onPressedNo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool useYes = true;
    return AlertDialog(
      backgroundColor: DSColors.cardColor,
      title: Text(title,),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: (){
                if(useYes == true){
                  onPressedYes!();
                }
                useYes = false;
              },
              child: Container(
                width: 110,
                height: 50,
                color: DSColors.primary,
                alignment: Alignment.center,
                child: const Text('SIM',style: TextStyle(color: DSColors.scaffoldBackground, fontWeight: FontWeight.bold),),
              ),
            ),
            const SizedBox(width: 8,),
            InkWell(
              onTap: onPressedNo,
              child: Container(
                width: 110,
                height: 50,
                color: DSColors.primary,
                alignment: Alignment.center,
                child: const Text('NÃO',style: TextStyle(color: DSColors.scaffoldBackground, fontWeight: FontWeight.bold),),
              ),
            ),
          ],
        )
      ],
    );
  }
}