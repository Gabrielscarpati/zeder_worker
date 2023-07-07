import '../../domain/entities/cancel_entity.dart';
import '../firebase/firebase_controller.dart';
import '../shared/name_collections.dart';

class CancelController {
  final _firebase = FirebaseController();
  final _collection = NameCollections.cancelCollection;

  Future<bool> cadastrarCancel(CancelEntity cancel) async {
    try {
       String id = await _firebase.cadastrarDado(
        data: cancel,
        collection: _collection,

      );

       await _firebase.atualizarDado(
         collection: _collection,
         id: id,
         data: cancel,
       );

      return true;
    } catch (e, stackTrace) {
      return Future.error(
          "Erro ao tentar cadastrar o usuario ${e.toString()}{", stackTrace);
    }
  }

  Future<void> atualizarCancel(CancelEntity cancel) async {
    try {
      await _firebase.atualizarDado(
        collection: _collection,
        id: cancel.id,
        data: cancel,
      );
    } catch (e, stackTrace) {
      return Future.error(
          "Erro ao tentar atualizar o usuario ${e.toString()}{", stackTrace);
    }
  }


  Future<CancelEntity> buscarLog(String cancelID) async {
    try {

      final dado = await _firebase.buscarDado(
        collection: _collection,
        id: cancelID,
      );

      final log = CancelEntity.fromJson(dado);
      return log;
    } catch (e, stackTrace) {
      return Future.error(e.toString(), stackTrace);
    }
  }

  Future<List<CancelEntity>> buscarCancelComCondicao(String cond, String condName )async{
    List<CancelEntity> retorno = [];
    try {
      final dado = await _firebase.buscarDadoComCondicao(collection: _collection, cond: cond, condName: condName  );
      dado.forEach((element) {
        retorno.add(CancelEntity.fromJson(element));
       });
     
      return retorno;
    } catch (e, stackTrace) {
      return Future.error(e.toString(), stackTrace);
    }
  }
}






