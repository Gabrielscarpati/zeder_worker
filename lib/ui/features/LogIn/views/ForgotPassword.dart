
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../application/provider/logInSignUpProvider.dart';
import '../../../device_type.dart';
import '../../LoadingButton.dart';
import 'widgets/widgetsForSignUp.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    LogInSignUpProvider provider = Provider.of<LogInSignUpProvider>(context,listen: false);
    double screenWidth = MediaQuery.of(context).size.width;
    double padding;
    DeviceType deviceType = getDeviceType(MediaQuery.of(context).size.width);
    deviceType == DeviceType.Desktop? padding = (screenWidth-900)/2 : padding = 16;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: BackButton(
            onPressed: () {
               provider.formKeyAuthenticationLogin.currentState!.reset();
              Navigator.of(context).pop();

            },
            color: Colors.black,
          ),
        ),
        body: Form(
          key: provider.formKeyAuthenticationResetPassword,
          child: Padding(
            padding: EdgeInsets.only(left: padding, right: padding, top: 16, bottom: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                 'Esqueceu sua senha?',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                       )
                    ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                    "Digite seu e-mail para que possamos enviar um link para você recuperar o acesso à sua conta e voltar a desfrutar do nosso aplicativo sem problemas.",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    )
                ),
                 SizedBox(
                  height: MediaQuery.of(context).size.height * 0.16,
                ),
                StandardController(
                  title: 'Email',
                  hint: 'Email',
                  validator: provider.validateEmailResetPassword,
                  prefixIcon: Icons.email,
                  sufixIcon: Icons.close,
                  deleteOrHide: 'delete',
                  nameController: provider.resetPasswordEmail,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.16,
                ),
                LoadingButton(
                  buttonText: 'Enviar email',
                  goNextScreen: () async {
                    await provider.resetPassword(
                      context: context,
                    );
                    provider.bntControllerForgotPassword.reset();
                  },
                  controller: provider.bntControllerForgotPassword,
                ),
              ],
            ),
          ),
        )
    );
  }
}
