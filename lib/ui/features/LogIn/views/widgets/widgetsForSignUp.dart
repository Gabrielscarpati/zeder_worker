import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:zeder/design_system/design_system.dart';

import '../../../../../design_system/parameters/colors.dart';

class StandardController extends StatefulWidget {
  final String title;
  final String? Function(String?)? validator;
  final TextEditingController nameController;
  final IconData prefixIcon;
  final IconData sufixIcon;
  final String hint;
  final String deleteOrHide;
  final bool? multilineText;
  final int? maxLines;
  final bool? iSkeyboardTypeNumber;

  const StandardController({Key? key, required this.nameController, required this.hint, required this.validator, required this.prefixIcon, required this.sufixIcon, required this.deleteOrHide, required this.title, this.multilineText, this.maxLines, this.iSkeyboardTypeNumber}) : super(key: key);

  @override
  State<StandardController> createState() => _StandardControllerState();
}

class _StandardControllerState extends State<StandardController> {
  bool passwordIsHidden = false;

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 12, bottom: 8),
          child: DSTextSubtitleBoldSecondary(text: widget.title),
        ),
        SizedBox(
          child: TextFormField(
            textAlignVertical: TextAlignVertical.bottom,
            validator: widget.validator,
            style: const TextStyle(
              fontSize: 16,
              color: DSColors.tertiary,
            ),
            obscureText: widget.deleteOrHide == 'hide' ? passwordIsHidden : false,
            controller: widget.nameController,
            cursorColor: Colors.indigoAccent,
            maxLines: widget.maxLines,
            minLines: 1,
            keyboardType:  widget.iSkeyboardTypeNumber == true? TextInputType.number: widget.multilineText == null|| widget.multilineText == false? TextInputType.emailAddress:TextInputType.multiline,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.white,
              hintText: widget.hint,
              hintStyle: const TextStyle(
                fontSize: 16,
                color: DSColors.tertiary,
              ),

              prefixIcon: Icon(widget.prefixIcon, color: DSColors.tertiary,),
              suffixIcon:
              widget.deleteOrHide == "hide"?

              InkWell(
                onTap: () {
                  setState(() {
                    passwordIsHidden = !passwordIsHidden;
                  });
                },
                child: Icon(
                  passwordIsHidden
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: DSColors.tertiary,
                ),
              ):
              IconButton(
                  icon: Icon(widget.sufixIcon, color: DSColors.tertiary,),
                  onPressed: () => widget.nameController.clear()
              )
            ),
          ),
        ),
      ],
    );
  }
}

class EmailController extends StatelessWidget {
  final TextEditingController emailController;
  final String hint;
  final IconData iconData;
   const EmailController({Key? key, required this.emailController, required this.hint, required this.iconData}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 8),
      child: SizedBox(
        child: Material(
          elevation: 8,
          shadowColor: Colors.black87,
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(30),
          child: TextFormField(
            textAlignVertical: TextAlignVertical.bottom,
            validator: (emailController) =>
            !EmailValidator.validate(
                emailController!)
                ? 'Invalid Email'
                : null,
            controller: emailController,
            cursorColor: Colors.indigoAccent,

            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.white,
              hintText: hint,
              prefixIcon: Icon(iconData,color: Colors.green,),
              suffixIcon: IconButton(
                icon: const Icon(Icons.close, color: Colors.green,),
                onPressed: () =>
                    emailController.clear(),
              ),
            ),
            keyboardType: TextInputType.emailAddress,
          ),
        ),
      ),
    );
  }
}


class PasswordController extends StatefulWidget {
  final TextEditingController passwordController;
  final String hint;
  final IconData iconData;
  const PasswordController({Key? key, required this.passwordController, required this.hint, required this.iconData}) : super(key: key);

  @override
  State<PasswordController> createState() => _PasswordControllerState();
}

class _PasswordControllerState extends State<PasswordController> {
  bool passwordIsHidden = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 8),
      child: SizedBox(
        child: Material(
          elevation: 8,
          shadowColor: Colors.black87,
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(30),
          child: TextFormField(
            textAlignVertical: TextAlignVertical.bottom,
            validator: (passwordController) {
              if (passwordController!.trim().length< 6 ) {
                return "Your password must contain at least 6 characters";
              } else {
                return null;
              }
            },
            controller: widget.passwordController,
            cursorColor: Colors.indigoAccent,
            obscureText: passwordIsHidden,

            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.white,
              hintText: widget.hint,

              prefixIcon: Icon(widget.iconData,color: Colors.green,),
              suffixIcon: InkWell(
                onTap: () {
                  setState(() {
                    passwordIsHidden = !passwordIsHidden;
                  });
                },
                child: Icon(
                  passwordIsHidden
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: Colors.green,
                ),
              ),
            ),
            keyboardType: TextInputType.emailAddress,
          ),
        ),
      ),
    );
  }
}

class AdditionalMedicalConditions extends StatefulWidget {
  final TextEditingController passwordController;
  final String hint;
  final IconData iconData;
  const AdditionalMedicalConditions({Key? key, required this.passwordController, required this.hint, required this.iconData}) : super(key: key);

  @override
  State<AdditionalMedicalConditions> createState() => _AdditionalMedicalConditionsState();
}

class _AdditionalMedicalConditionsState extends State<AdditionalMedicalConditions> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 8),
      child: SizedBox(
        child: Material(
          elevation: 8,
          shadowColor: Colors.black87,
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(30),
          child: TextFormField(
            textAlignVertical: TextAlignVertical.bottom,
            validator: (passwordController) {
              if (passwordController!.isEmpty ||
                  !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$')
                      .hasMatch(passwordController)) {
                return "Your password must contain an uppercase and lowercase\nletter and a number and at least 8 characters";
              } else {
                return null;
              }
            },
            controller: widget.passwordController,
            cursorColor: Colors.indigoAccent,

            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.white,
              hintText: widget.hint,

              prefixIcon: Icon(widget.iconData,color: Colors.green,),

            ),
            keyboardType: TextInputType.emailAddress,
          ),
        ),
      ),
    );
  }
}
