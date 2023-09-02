import 'package:flutter/cupertino.dart';

import '../../../../design_system/widgets/text.dart';
import '../../../../utils/flutter_get_Location.dart';

class HeaderSignUp extends StatefulWidget {
  const HeaderSignUp({Key? key}) : super(key: key);

  @override
  State<HeaderSignUp> createState() => _HeaderSignUpState();
}

class _HeaderSignUpState extends State<HeaderSignUp> {
  @override
  Widget build(BuildContext context) {
    GetLocation getLocation = GetLocation();
    return Column(
      children: [
        DSTextTitleBoldSecondary(
          text: getLocation.locationBR ? 'Cadastre-se' : 'Sign Up',
        ),
      ],
    );
  }
}
