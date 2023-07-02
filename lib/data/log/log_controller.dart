import 'package:zeder/domain/entities/log_entity.dart';
import '../firebase/firebase_controller.dart';
import '../shared/name_collections.dart';

class LogController {
  final _firebase = FirebaseController();
  final _collection = NameCollections.logCollection;

  Future<bool> cadastrarLog(LogEntity log) async {
    try {
       String id = await _firebase.cadastrarDado(
        data: log,
        collection: _collection,
      );

       await _firebase.atualizarDado(
         collection: _collection,
         id: id,
         data: log,
       );

      return true;
    } catch (e, stackTrace) {
      return Future.error(
          "Erro ao tentar cadastrar o usuario ${e.toString()}{", stackTrace);
    }
  }

  Future<void> atualizarLog(LogEntity log) async {
    try {
      await _firebase.atualizarDado(
        collection: _collection,
        id: log.id,
        data: log,
      );
    } catch (e, stackTrace) {
      return Future.error(
          "Erro ao tentar atualizar o usuario ${e.toString()}{", stackTrace);
    }
  }


  Future<LogEntity> buscarLog(String logID) async {
    try {

      final dado = await _firebase.buscarDado(
        collection: _collection,
        id: logID,
      );

      final log = LogEntity.fromJson(dado);
      return log;
    } catch (e, stackTrace) {
      return Future.error(e.toString(), stackTrace);
    }
  }

  Future<List<LogEntity>> buscarLogComCondicao(String cond, String condName )async{
    List<LogEntity> retorno = [];
    try {
      final dado = await _firebase.buscarDadoComCondicao(collection: _collection, cond: cond, condName: condName  );
      dado.forEach((element) {
        retorno.add(LogEntity.fromJson(element));
       });
     
      return retorno;
    } catch (e, stackTrace) {
      return Future.error(e.toString(), stackTrace);
    }
  }
}






