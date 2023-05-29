import '../../domain/entities/tipo_servico_entity.dart';
import '../firebase/firebase_controller.dart';
import '../shared/name_collections.dart';

class TiposServicoController {
  final _firebase = FirebaseController();
  final _collection = NameCollections.tiposServicoCollection;

  Future<void> atualizarTiposServico(TipoServicoEntity servicos) async {
    try {
      await _firebase.atualizarDado(
        collection: _collection,
        id: servicos.id,
        data: servicos,
      );
    } catch (e, stackTrace) {
      return Future.error(
          "Erro ao tentar atualizar o usuario ${e.toString()}{", stackTrace);
    }
  }

  Future<TipoServicoEntity> buscarTiposServico(String userId) async {
    try {
      final dado = await _firebase.buscarDado(
        collection: _collection,
        id: userId,
      );
      final servicos = TipoServicoEntity.fromJson(dado);
      return servicos;
    } catch (e, stackTrace) {
      return Future.error(e.toString(), stackTrace);
    }
  }

  Future<List<TipoServicoEntity>> buscarTiposServicoComCondicao(String cond, String condName)async{
    List<TipoServicoEntity> retorno = [];
    try {
      final dado = await _firebase.buscarDadoComCondicao(collection: _collection, cond: cond, condName: condName  );
      dado.forEach((element) {
        retorno.add(TipoServicoEntity.fromJson(element));
       });
     
      return retorno;
    } catch (e, stackTrace) {
      return Future.error(e.toString(), stackTrace);
    }
  }
}
