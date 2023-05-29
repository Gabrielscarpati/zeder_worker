import 'package:zeder/data/user/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../firebase/firebase_controller.dart';
import '../shared/name_collections.dart';

class UserController {
  final _firebase = FirebaseController();
  final _collection = NameCollections.userCollection;

  Future<bool> cadastrarUsuario(UserEntity user) async {
    try {

      
       await _firebase.atualizarDado(
        data: user,
        id: user.id,
        collection: _collection,
      );

      return true;
    } catch (e, stackTrace) {
      return Future.error(
          "Erro ao tentar cadastrar o usuario ${e.toString()}{", stackTrace);
    }
  }

  Future<void> atualizarUsuario(UserEntity user) async {
    try {
      await _firebase.atualizarDado(
        collection: _collection,
        id: user.id,
        data: user,
      );
    } catch (e, stackTrace) {
      return Future.error(
          "Erro ao tentar atualizar o usuario ${e.toString()}{", stackTrace);
    }
  }

  Future<UserEntity> buscarUsuario(String userId) async {
    try {
      final dado = await _firebase.buscarDado(
        collection: _collection,
        id: userId,
      );
      final user = UserEntity.fromJson(dado);
      return user;
    } catch (e, stackTrace) {
      return Future.error(e.toString(), stackTrace);
    }
  }

  Future<List<UserEntity>> buscarUserComCondicao(String cond, String condName )async{
    List<UserEntity> retorno = [];
    try {
      final dado = await _firebase.buscarDadoComCondicao(collection: _collection, cond: cond, condName: condName  );
      dado.forEach((element) {
        retorno.add(UserEntity.fromJson(element));
       });
     
      return retorno;
    } catch (e, stackTrace) {
      return Future.error(e.toString(), stackTrace);
    }
  }
}






