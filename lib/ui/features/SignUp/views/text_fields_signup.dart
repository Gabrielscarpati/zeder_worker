import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

    final provider = context.read<LogInSignUpProvider>();

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
            children: [
              StandardController(
                title: 'Nome completo',
                hint: 'Digite seu nome completo',
                nameController: provider.signUpName,
                validator: provider.validateName,
                prefixIcon: Icons.person,
                sufixIcon:  Icons.close,
                deleteOrHide: 'delete',
              ),
              StandardController(
                title: 'Telefone',
                hint: 'Digite apenas números',
                nameController: provider.signUpPhone,
                validator: provider.validatePhone,
                prefixIcon: Icons.phone,
                sufixIcon:  Icons.close,
                deleteOrHide: 'delete',
                /*inputFormatters: [
                  TelefoneInputFormatter(),
                ],*/
              ),

              StandardController(
                title: 'CPF',
                hint: 'Digite apenas números',
                nameController: provider.signUpCPF,
                validator: provider.validateCPF, //mudar
                prefixIcon: Icons.call_to_action,
                sufixIcon:  Icons.close,
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
                sufixIcon:  Icons.close,
                deleteOrHide: 'delete',
              ),
              StandardController(
                title: 'Senha',
                hint: 'Digite sua senha',
                nameController: provider.signUpPassword,
                validator: provider.validatePassword,
                prefixIcon: Icons.lock,
                sufixIcon:  Icons.close,
                deleteOrHide: 'hide',
              ),
              StandardController(
                title: 'Confirmar senha',
                hint: 'Confirme sua senha',
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
