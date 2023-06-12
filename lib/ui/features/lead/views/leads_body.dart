import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import '../../../../application/provider/lead_provider.dart';
import '../../LogIn/views/widgets/widgetsForSignUp.dart';

class MakeLeadBody extends StatelessWidget {
  const MakeLeadBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LeadProvider provider = context.watch<LeadProvider>();
    String? validateEmail(String? value) {
      if (value == null || value.isEmpty) {
        return 'Please enter some text';
      }
      return null;
    }
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: provider.formKeyAuthenticationLead,
        child: Column(
          children: [
            /*StandardController(
              nameController: provider.priceController,
              hint: 'Type the price here?',
              validator: validateEmail,
              prefixIcon: MdiIcons.currencyUsd,
              sufixIcon: Icons.close,
              deleteOrHide: 'delete',
              title: 'What is your price?',
            ),
            StandardController(
              nameController: provider.startingDate,
              hint: 'Type date here',
              validator: validateEmail,
              prefixIcon: MdiIcons.calendarRange,
              sufixIcon: Icons.close,
              deleteOrHide: 'delete',
              title: 'When is your starting date',
            ),*/
          ],
        ),
      ),
    );
  }
}
//StandardController