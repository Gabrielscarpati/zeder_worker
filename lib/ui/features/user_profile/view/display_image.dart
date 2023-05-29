import 'package:flutter/material.dart';
import 'package:zeder/design_system/design_system.dart';

class DisplayImage extends StatelessWidget {
  final String imagePath;
  final VoidCallback onPressed;
  const DisplayImage({
    Key? key,
    required this.imagePath,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 170,
      height: 170,
      child: Center(
          child: InkWell(
            child: Stack(children: [
              imagePath != null? CircleAvatar(
                backgroundImage: NetworkImage(imagePath),
                radius: 70,
              )
              : const Padding(
                padding: EdgeInsets.all(4.0),
                child: CircularProgressIndicator(),
              ),
              const Positioned(
                right: 4,
                top: 100,
                child: DSIconFilledTertiary(
                  iconName: 'camera',
                ),
              )
            ]),
          )),
    );
  }
}