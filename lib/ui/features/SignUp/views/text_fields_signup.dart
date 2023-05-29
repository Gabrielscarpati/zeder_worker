import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zeder/ui/features/SignUp/views/widgets/widgetsForSignUp.dart';
import '../../../../application/provider/logInSignUpProvider.dart';

class TextFieldsSingUp extends StatefulWidget {
  const TextFieldsSingUp({Key? key}) : super(key: key);


  @override
  State<TextFieldsSingUp> createState() => _TextFieldsSingUpState();
}

class _TextFieldsSingUpState extends State<TextFieldsSingUp> {

  @override
  Widget build(BuildContext context) {

    String? validateEmail(String? value) {
      if (value == null || value.isEmpty) {
        return 'Please enter some text';
      }
      return null;
    }

    final provider = context.read<LogInSignUpProvider>();

    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
            children: [
              StandardController(
                title: 'First Name',
                hint: 'First Name',
                nameController: provider.signUpName,
                validator: provider.validateName,
                prefixIcon: Icons.person,
                sufixIcon:  Icons.close,
                deleteOrHide: 'delete',
              ),
              StandardController(
                title: 'Phone',
                hint: 'Phone Number',
                nameController: provider.signUpPhone,
                validator: provider.validatePhone,
                prefixIcon: Icons.phone,
                sufixIcon:  Icons.close,
                deleteOrHide: 'delete',
              ),
              StandardController(
                title: 'Email',
                hint: 'Email',
                nameController: provider.signUpEmail,
                validator: provider.validateEmail,
                prefixIcon: Icons.email,
                sufixIcon:  Icons.close,
                deleteOrHide: 'delete',
              ),
              StandardController(
                title: 'Password',
                hint: 'Password',
                nameController: provider.signUpPassword,
                validator: provider.validatePassword,
                prefixIcon: Icons.lock,
                sufixIcon:  Icons.close,
                deleteOrHide: 'hide',
              ),
              StandardController(
                title: 'Confirm Password',
                hint: 'Confirm Password',
                nameController: provider.signUpConfirmPassword,
                validator: provider.confirmPassword,
                prefixIcon: Icons.lock_reset,
                sufixIcon:  Icons.close,
                deleteOrHide: 'hide',
              ),
        ],
      ),
    );
  }
}
