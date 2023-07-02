import '../../domain/entities/disputa_entity.dart';
import '../firebase/firebase_controller.dart';
import '../shared/name_collections.dart';

class DisputaController {
  final _firebase = FirebaseController();
  final _collection = NameCollections.disputaCollection;

  Future<String> cadastrarDisputa(DisputaEntity disputa) async {
    try {
       String id = await _firebase.cadastrarDado(
        data: disputa,
        collection: _collection,
      );

       await _firebase.atualizarDado(
         collection: _collection,
         id: id,
         data: disputa,
       );

      return id;
    } catch (e, stackTrace) {
      return Future.error(
          "Erro ao tentar cadastrar o usuario ${e.toString()}{", stackTrace);
    }
  }

  Future<void> atualizarDisputa(DisputaEntity disputa) async {
    try {
      await _firebase.atualizarDado(
        collection: _collection,
        id: disputa.id,
        data: disputa,
      );
    } catch (e, stackTrace) {
      return Future.error(
          "Erro ao tentar atualizar o usuario ${e.toString()}{", stackTrace);
    }
  }


  Future<DisputaEntity> buscarLog(String disputaID) async {
    try {

      final dado = await _firebase.buscarDado(
        collection: _collection,
        id: disputaID,
      );

      final log = DisputaEntity.fromJson(dado);
      return log;
    } catch (e, stackTrace) {
      return Future.error(e.toString(), stackTrace);
    }
  }

  Future<List<DisputaEntity>> buscarDisputaComCondicao(String cond, String condName)async{
    List<DisputaEntity> retorno = [];
    try {
      final dado = await _firebase.buscarDadoComCondicao(collection: _collection, cond: cond, condName: condName  );
      dado.forEach((element) {
        retorno.add(DisputaEntity.fromJson(element));
       });
     
      return retorno;
    } catch (e, stackTrace) {
      return Future.error(e.toString(), stackTrace);
    }
  }
}






