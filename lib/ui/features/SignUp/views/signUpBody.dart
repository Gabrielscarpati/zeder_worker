import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zeder/ui/features/SignUp/views/button_switch_screens.dart';
import 'package:zeder/ui/features/SignUp/views/text_fields_signup.dart';

import '../../../../application/provider/logInSignUpProvider.dart';
import '../../../../design_system/parameters/colors.dart';
import '../../../device_type.dart';
import 'checkbox_zeder.dart';
import 'get_save_image.dart';
import 'header_signup.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.read<LogInSignUpProvider>();
    double screenWidth = MediaQuery.of(context).size.width;
    double padding;
    DeviceType deviceType = getDeviceType(MediaQuery.of(context).size.width);
    deviceType == DeviceType.Desktop
        ? padding = (screenWidth - 900) / 2
        : padding = 16;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: DSColors.scaffoldBackground,
      body: Padding(
        padding: EdgeInsets.only(left: padding, right: padding, top: 44),
        child: Container(
          color: DSColors.scaffoldBackground,
          height: MediaQuery.of(context).size.height,
          child: Form(
            key: provider.formKeyAuthenticationSignUp,
            child:  SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  HeaderSignUp(),
                  GetSaveImage(),
                  TextFieldsSingUp(),
                  CheckboxZeder(),
                  SizedBox(
                    height: 12,
                  ),
                  ButtonSwitchScreens(),
                ],
              ),
            ),
          ),
        ),
      ),
      //bottomNavigationBar: ButtonSwitchScreens(),
    );
  }
}
