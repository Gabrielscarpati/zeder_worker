import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zeder/ui/features/SignUp/views/widgets/termsAndConditions.dart';
import '../../../../application/provider/logInSignUpProvider.dart';
import '../../../../application/provider/pesquisa_cidade_provider.dart';
import '../../../../design_system/parameters/colors.dart';

class CheckboxZeder extends StatefulWidget {
  const CheckboxZeder({Key? key}) : super(key: key);

  @override
  State<CheckboxZeder> createState() => _CheckboxZederState();
}

class _CheckboxZederState extends State<CheckboxZeder> {
  PesquisaCidadeProvider pesquisaCidadeProvider = PesquisaCidadeProvider();

  @override
  Widget build(BuildContext context) {
    final provider = context.read<LogInSignUpProvider>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CheckboxListTile(
          activeColor: DSColors.primary,
          value: provider.isChecked,
          onChanged: (bool? newValue) {
            provider.updateIsCheck();
            setState(() {
              provider.isChecked = provider.isChecked;
            });
          },
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'EU li e concordei com os',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                      Text(
                        'Termos e condicões',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: DSColors.primary,
                            fontSize: 14),
                      ),
                    ],
                  ),
                  onTap: () {
                    viewTermsAndConditions(context);
                  }
              ),
            ],
          ),

          checkColor: Colors.indigo,
        ),
      ],
    );
  }
  Future viewTermsAndConditions(context) => showDialog(
    context: context,
    builder: (context) =>  ViewTermsAndConditions(termsAndConditions: pesquisaCidadeProvider.terms,),
  );
}
