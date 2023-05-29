import 'package:flutter_modular/flutter_modular.dart';
import '../data/user/user_controller.dart';


class VerificaUserERedireciona{
  final UserController userController = UserController();
  //final TutorController tutorController = TutorController();

  
  Future<void> action(String uid)async{
    final users =
            await userController.buscarUserComCondicao(uid, 'user_id');
       // final tutors = await tutorController.buscarTutorComCondicao(uid, 'user_id');

        if (users.isEmpty) {
          Modular.to.pushReplacementNamed('/cadastroUser');
          return;
        }

        /*if (tutors.isEmpty) {
           Modular.to.pushReplacementNamed('/cadastroUser');
         
          return;
        }*/
         Modular.to.pushReplacementNamed('/home');
        

  }
}