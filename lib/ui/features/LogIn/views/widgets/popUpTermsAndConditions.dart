import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zeder/design_system/design_system.dart';

class PopUpTermsAndConditions extends StatelessWidget {
  const PopUpTermsAndConditions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Aceite os termos e condições para\nse  Cadastrar!',
        textAlign: TextAlign.center ,
        style: TextStyle(color: DSColors.primary,
            fontWeight: FontWeight.bold,
            fontSize: 28),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.of(context).pop(),
          child: Ink(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    DSColors.primary
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(30.0)),
            child: Container(
              constraints: BoxConstraints(
                  maxWidth: 350.0, minHeight: 50.0),
              alignment: Alignment.center,
              child: Text(
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
