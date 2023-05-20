import 'package:flutter/material.dart';
import 'package:zeder/design_system/design_system.dart';

class DSInfoCard extends StatelessWidget {
  final Widget topinfo; 
  final Widget bottoninfo;
  final VoidCallback? onTap;
  Color? color;

  DSInfoCard({
    super.key,
    required this.topinfo,
    required this.bottoninfo,
    this.onTap,
    this.color = DSColors.cardColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color ,
      surfaceTintColor: DSColors.cardColor,
      elevation: 0.0,
      child:  Container(
        height: 170,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
        topinfo,
           bottoninfo
      ],) ,) ,) ,) 
      
    );
  }
}