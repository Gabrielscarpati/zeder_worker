import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:zeder/ui/features/SignUp/views/widgets/widgetsForSignUp.dart';
import 'package:zeder/utils/flutter_get_Location.dart';

import '../../../../application/provider/logInSignUpProvider.dart';

class TextFieldsSingUp extends StatefulWidget {
  const TextFieldsSingUp({Key? key}) : super(key: key);

  @override
  State<TextFieldsSingUp> createState() => _TextFieldsSingUpState();
}

class _TextFieldsSingUpState extends State<TextFieldsSingUp> {
  @override
  Widget build(BuildContext context) {
    final provider = context.read<LogInSignUpProvider>();
    GetLocation getLocation = GetLocation();
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          StandardController(
            title: getLocation.locationBR
                ? 'Nome e sobrenome'
                : 'Name and Last Name',
            hint: getLocation.locationBR
                ? 'Digite seu nome sobrenome'
                : 'Type your name and last name',
            nameController: provider.signUpName,
            validator: provider.validateName,
            prefixIcon: Icons.person,
            sufixIcon: Icons.close,
            deleteOrHide: 'delete',
          ),
          StandardController(
            title: getLocation.locationBR ? 'Telefone' : 'Phone',
            hint: getLocation.locationBR
                ? 'Digite apenas números'
                : 'Type only numbers',
            nameController: provider.signUpPhone,
            validator: provider.validatePhone,
            prefixIcon: Icons.phone,
            sufixIcon: Icons.close,
            deleteOrHide: 'delete',
            /*inputFormatters: [
                  TelefoneInputFormatter(),
                ],*/
          ),
          StandardController(
            title: getLocation.locationBR ? 'CPF' : 'SSN',
            hint: getLocation.locationBR
                ? 'Digite apenas números'
                : 'Type only numbers',
            nameController: provider.signUpCPF,
            validator: provider.validateCPF, //mudar
            prefixIcon: Icons.call_to_action,
            sufixIcon: Icons.close,
            deleteOrHide: 'delete',
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              CpfInputFormatter(),
            ],
          ),
          StandardController(
            title: 'Email',
            hint: 'Email',
            nameController: provider.signUpEmail,
            validator: provider.validateEmail,
            prefixIcon: Icons.email,
            sufixIcon: Icons.close,
            deleteOrHide: 'delete',
          ),
          StandardController(
            title: getLocation.locationBR ? 'Senha' : 'Password',
            hint: getLocation.locationBR
                ? 'Digite sua senha'
                : 'Enter your password',
            nameController: provider.signUpPassword,
            validator: provider.validatePassword,
            prefixIcon: Icons.lock,
            sufixIcon: Icons.close,
            deleteOrHide: 'hide',
          ),
          StandardController(
            title:
                getLocation.locationBR ? 'Confirmar senha' : 'Confirm password',
            hint: getLocation.locationBR
                ? 'Confirme sua senha'
                : 'Confirm your password',
            nameController: provider.signUpConfirmPassword,
            validator: provider.confirmPassword,
            prefixIcon: Icons.lock_reset,
            sufixIcon: Icons.close,
            deleteOrHide: 'hide',
          ),
        ],
      ),
    );
  }
}
