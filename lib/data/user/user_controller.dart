import 'package:zeder/data/user/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../firebase/firebase_controller.dart';
import '../shared/name_collections.dart';

class WorkerController {
  final _firebase = FirebaseController();
  final _collection = NameCollections.workerCollection;

  Future<bool> cadastrarWorker(WorkerEntity user) async {
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

  Future<void> atualizarWorker(WorkerEntity user) async {
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

  Future<void> atualizarWorkerPicture(WorkerEntity worker, String profilePicture) async {
    try {
      await _firebase.atualizarDado(
        collection: _collection,
        id: worker.id,
        data: worker.copyWith(profile_picture: profilePicture)
      );
    } catch (e, stackTrace) {
      return Future.error(
          "Erro ao tentar atualizar o usuario ${e.toString()}{", stackTrace);
    }
  }

  Future<WorkerEntity> buscarWorker(String userId) async {
    try {

      final dado = await _firebase.buscarDado(
        collection: _collection,
        id: userId,
      );

      final user = WorkerEntity.fromJson(dado);
      return user;
    } catch (e, stackTrace) {
      return Future.error(e.toString(), stackTrace);
    }
  }

  Future<List<WorkerEntity>> buscarWorkerComCondicao(String cond, String condName )async{
    List<WorkerEntity> retorno = [];
    try {
      final dado = await _firebase.buscarDadoComCondicao(collection: _collection, cond: cond, condName: condName  );
      dado.forEach((element) {
        retorno.add(WorkerEntity.fromJson(element));
       });
     
      return retorno;
    } catch (e, stackTrace) {
      return Future.error(e.toString(), stackTrace);
    }
  }
}






