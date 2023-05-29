import 'package:flutter/cupertino.dart';

import '../../../../design_system/widgets/text.dart';

class HeaderLogIn extends StatefulWidget {
  const HeaderLogIn({Key? key}) : super(key: key);

  @override
  State<HeaderLogIn> createState() => _HeaderLogInState();
}

class _HeaderLogInState extends State<HeaderLogIn> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        DSTextTitleBoldSecondary(text: "Welcome back"),
      ],
    );
  }
}
