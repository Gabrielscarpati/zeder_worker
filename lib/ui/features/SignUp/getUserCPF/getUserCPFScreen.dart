import 'package:flutter/material.dart';
import 'package:zeder/ui/features/SignUp/getUserCPF/views/bodyGetUserCPF.dart';

class GetUserCPFScreen extends StatelessWidget {


  const GetUserCPFScreen({Key? key,

  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BodyGetUserCPF(),
    );
  }
}
