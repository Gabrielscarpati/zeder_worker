import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zeder/ui/features/LogIn/views/header_logIn.dart';
import 'package:zeder/ui/features/LogIn/views/text_fields_login.dart';
import '../../../../application/provider/logInSignUpProvider.dart';
import '../../../../design_system/parameters/colors.dart';
import '../../../device_type.dart';
import 'button_switch_screens_login.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.read<LogInSignUpProvider>();
    double screenWidth = MediaQuery.of(context).size.width;
    double padding;
    DeviceType deviceType = getDeviceType(MediaQuery.of(context).size.width);
    deviceType == DeviceType.Desktop? padding = (screenWidth-900)/2 : padding = 16;
    //          padding: EdgeInsets.only(right: padding, left: padding),

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: DSColors.scaffoldBackground,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: padding,right: padding, top: 44),
          child: Container(
            color: DSColors.scaffoldBackground,
            height: MediaQuery.of(context).size.height,
            child: Form(
              key: provider.formKeyAuthenticationLogin,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      HeaderLogIn(),
                      TextFieldsLogin(),
                      SizedBox(),
                      SizedBox(height: 140,),
                      ButtonSwitchScreensLogIn(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
