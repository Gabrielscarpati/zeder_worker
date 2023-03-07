import 'package:flutter/material.dart';

class PopUpIncorrectPassword extends StatelessWidget {
  const PopUpIncorrectPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Incorrect password\ntry again!!!',
        textAlign: TextAlign.center ,
        style: TextStyle(color: Colors.green.shade700,
            fontWeight: FontWeight.bold,
            fontSize: 28),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.of(context).pop(),
          child: Ink(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.green.shade700,
                    Colors.green.shade700,
                    Colors.green.shade700
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(30.0)),
            child: Container(
              color: Colors.green.shade700,

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
