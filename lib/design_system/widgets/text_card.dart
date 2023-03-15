import 'package:flutter/material.dart';

class TextCard extends StatelessWidget {
  final String? hintText;
  final TextEditingController textEditingController;
  const TextCard({Key? key,
    required this.hintText,
    required this.textEditingController
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ConstrainedBox(
        constraints: const BoxConstraints(
          minHeight: 120,
        maxHeight: 600,
    ),
      child:Card(
        color: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
              Radius.circular(12)),
        ),
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: TextField(
            maxLines: null,
            controller: textEditingController,
           keyboardType: TextInputType.multiline,
            cursorColor: Colors.indigoAccent,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(
                color: Colors.black,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      );
  }
}






