import 'package:flutter/cupertino.dart';
import '../../../main.dart';
import 'views/signUpBody.dart';

class ViewSignUp extends StatelessWidget {
  const ViewSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoadData(
        body: SignUpBody()
    );
  }
}

