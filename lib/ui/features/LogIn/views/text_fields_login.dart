import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zeder/ui/features/SignUp/views/widgets/widgetsForSignUp.dart';
import '../../../../application/provider/logInSignUpProvider.dart';

class TextFieldsLogin extends StatefulWidget {
  const TextFieldsLogin({Key? key}) : super(key: key);


  @override
  State<TextFieldsLogin> createState() => _TextFieldsLoginState();
}

class _TextFieldsLoginState extends State<TextFieldsLogin> {

  @override
  Widget build(BuildContext context) {
    final provider = context.read<LogInSignUpProvider>();

    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
            children: [
              StandardController(
                title: 'Email',
                hint: 'Email',
                nameController: provider.loginEmail,
                validator: provider.validateEmailLogIn,
                prefixIcon: Icons.email,
                sufixIcon:  Icons.close,
                deleteOrHide: 'delete',
              ),
              StandardController(
                title: 'Senha',
                hint: 'Digite sua senha',
                nameController: provider.loginPassword,
                validator: provider.validatePasswordLogIn,
                prefixIcon: Icons.lock,
                sufixIcon:  Icons.close,
                deleteOrHide: 'hide',
              ),
        ],
      ),
    );
  }
}
