import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import '../../../../application/provider/logInSignUpProvider.dart';
import '../../../../design_system/parameters/colors.dart';
import '../../../../design_system/widgets/text.dart';
import '../../LoadingButton.dart';
import '../../SignUp/viewSignUp.dart';

class ButtonSwitchScreensLogIn extends StatefulWidget {
  const ButtonSwitchScreensLogIn({Key? key}) : super(key: key);

  @override
  State<ButtonSwitchScreensLogIn> createState() => _ButtonSwitchScreensLogInState();
}

class _ButtonSwitchScreensLogInState extends State<ButtonSwitchScreensLogIn> {
  final RoundedLoadingButtonController _controller = RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {
    final provider = context.read<LogInSignUpProvider>();

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        LoadingButton(
          goNextScreen:() async{
            provider.loginUser(context);
            _controller.reset();
          },
          buttonText: "Log in",
          controller: _controller,
        ),
        const SizedBox(height: 8,),
        GestureDetector(
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              DSTextSubtitleSecondary(
                text: "You don't have an account?",
              ),
              SizedBox(width: 4,),
              Text('Sign up',
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
            Navigator.of(context).push(
                MaterialPageRoute(
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
