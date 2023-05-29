import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zeder/ui/features/SignUp/views/button_switch_screens.dart';
import 'package:zeder/ui/features/SignUp/views/text_fields_signup.dart';
import '../../../../application/provider/logInSignUpProvider.dart';
import '../../../../design_system/parameters/colors.dart';
import 'checkbox_zeder.dart';
import 'get_save_image.dart';
import 'header_signup.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.read<LogInSignUpProvider>();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: DSColors.scaffoldBackground,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16,right: 16, top: 44),
          child: Container(
            color: DSColors.scaffoldBackground,
            height: MediaQuery.of(context).size.height,
            child: Form(
              key: provider.formKeyAuthenticationSignUp,
              child: const SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    HeaderSignUp(),
                    GetSaveImage(),
                    TextFieldsSingUp(),
                    CheckboxZeder(),
                    SizedBox(height: 12,),
                    ButtonSwitchScreens(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
