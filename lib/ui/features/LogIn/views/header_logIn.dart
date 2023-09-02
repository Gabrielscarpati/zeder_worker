import 'package:flutter/cupertino.dart';

import '../../../../design_system/widgets/text.dart';
import '../../../../utils/flutter_get_Location.dart';

class HeaderLogIn extends StatefulWidget {
  const HeaderLogIn({Key? key}) : super(key: key);

  @override
  State<HeaderLogIn> createState() => _HeaderLogInState();
}

class _HeaderLogInState extends State<HeaderLogIn> {
  @override
  Widget build(BuildContext context) {
    GetLocation getLocation = GetLocation();

    return Column(
      children: [
        DSTextTitleBoldSecondary(
          text:
              getLocation.locationBR ? "Bem-vindo de volta!" : "Welcome back!",
        ),
      ],
    );
  }
}
