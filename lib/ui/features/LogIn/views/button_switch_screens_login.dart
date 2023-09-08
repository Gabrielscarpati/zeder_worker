import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:zeder/ui/features/LogIn/views/ForgotPassword.dart';

import '../../../../application/provider/logInSignUpProvider.dart';
import '../../../../design_system/parameters/colors.dart';
import '../../../../design_system/widgets/text.dart';
import '../../../../utils/flutter_get_Location.dart';
import '../../LoadingButton.dart';
import '../../SignUp/viewSignUp.dart';

class ButtonSwitchScreensLogIn extends StatefulWidget {
  const ButtonSwitchScreensLogIn({Key? key}) : super(key: key);

  @override
  State<ButtonSwitchScreensLogIn> createState() =>
      _ButtonSwitchScreensLogInState();
}

class _ButtonSwitchScreensLogInState extends State<ButtonSwitchScreensLogIn> {
  final RoundedLoadingButtonController _controller =
      RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {
    final provider = context.read<LogInSignUpProvider>();
    GetLocation getLocation = GetLocation();

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  DSTextSubtitleSecondary(
                    text: getLocation.locationBR
                        ? "Esqueceu a senha?"
                        : "Forgot your password?",
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    getLocation.locationBR
                        ? 'Recuperar senha'
                        : 'Recover password',
                    style: const TextStyle(
                      decoration: TextDecoration.underline,
                      color: DSColors.primary,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              onTap: () {
                provider.formKeyAuthenticationLogin.currentState!.deactivate();

                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return const ForgotPassword();
                  },
                ));
              },
            ),
            const SizedBox(
              height: 24,
            ),
          ],
        ),
        LoadingButton(
          goNextScreen: () async {
            provider.loginUser(context);
            _controller.reset();
          },
          buttonText: getLocation.locationBR ? "Entrar" : "Log in",
          controller: _controller,
        ),
        const SizedBox(
          height: 24,
        ),
        GestureDetector(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              DSTextSubtitleSecondary(
                text: getLocation.locationBR
                    ? "Você não tem uma conta?"
                    : "Don't have an account?",
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                getLocation.locationBR ? 'Cadastre-se' : 'Sign up',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: DSColors.primary,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          onTap: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) {
                return const ViewSignUp();
              },
            ));
          },
        ),
      ],
    );
  }
}
