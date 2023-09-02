import 'package:flutter/material.dart';
import 'package:zeder/design_system/design_system.dart';
import 'package:zeder/utils/flutter_get_Location.dart';

class PopUpTermsAndConditions extends StatelessWidget {
  const PopUpTermsAndConditions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GetLocation getLocation = GetLocation();
    return AlertDialog(
      title: Text(
        getLocation.locationBR
            ? 'Aceite os termos e condiçōes\n para se cadastrar!!!'
            : 'Accept the terms and conditions\n to register!!!',
        textAlign: TextAlign.center,
        style: TextStyle(
            color: DSColors.primary, fontWeight: FontWeight.bold, fontSize: 24),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Ink(
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    DSColors.primary,
                    DSColors.primary,
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(30.0)),
            child: Container(
              constraints:
                  const BoxConstraints(maxWidth: 350.0, minHeight: 50.0),
              alignment: Alignment.center,
              child: const Text(
                'Ok',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        )
      ],
    );
  }
}
