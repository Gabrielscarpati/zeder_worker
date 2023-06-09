import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import '../../../../application/provider/logInSignUpProvider.dart';
import '../../../../design_system/parameters/colors.dart';
import '../../../../design_system/widgets/text.dart';
import '../../LoadingButton.dart';
import '../../LogIn/viewLogIn.dart';

class ButtonSwitchScreens extends StatefulWidget {
  const ButtonSwitchScreens({Key? key}) : super(key: key);

  @override
  State<ButtonSwitchScreens> createState() => _ButtonSwitchScreensState();
}

class _ButtonSwitchScreensState extends State<ButtonSwitchScreens> {
  final RoundedLoadingButtonController _controller = RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {
    final provider = context.read<LogInSignUpProvider>();

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        LoadingButton(
          goNextScreen:() async{
            provider.checkConditionsSignUpUser(context);
            _controller.reset();
          },
          buttonText: "Sign Up",
          controller: _controller,
        ),
        const SizedBox(height: 8,),
        GestureDetector(
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              DSTextSubtitleSecondary(
                text: "Already have an account?",
              ),
              SizedBox(width: 4,),
              Text('Log In',
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
                    return const ViewLogin();
                  },
                ));
          },
        ),
      ],
    );
  }
}
