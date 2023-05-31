import 'package:zeder/domain/domain.dart';
import '../firebase/firebase_controller.dart';
import '../shared/name_collections.dart';

class PropostasController {
  final _firebase = FirebaseController();
  final _collection = NameCollections.propostasCollection;

  Future<bool> cadastrarProposta(PropostaEntity user) async {
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

  Future<void> atualizarProposta(PropostaEntity proposta) async {
    try {
      await _firebase.atualizarDado(
        collection: _collection,
        id: proposta.id,
        data: proposta,
      );
    } catch (e, stackTrace) {
      return Future.error(
          "Erro ao tentar atualizar o usuario ${e.toString()}{", stackTrace);
    }
  }

  Future<PropostaEntity> buscarProposta(String propostaId) async {
    try {
      final dado = await _firebase.buscarDado(
        collection: _collection,
        id: propostaId,
      );
      final proposta = PropostaEntity.fromJson(dado);
      return proposta;
    } catch (e, stackTrace) {
      return Future.error(e.toString(), stackTrace);
    }
  }

  Future<List<PropostaEntity>> buscarPropostaComCondicao({required String cond, required String condName})async{
    List<PropostaEntity> retorno = [];
    try {
      final dado = await _firebase.buscarDadoComCondicao(collection: _collection, cond: cond, condName: condName  );
      dado.forEach((element) {
        retorno.add(PropostaEntity.fromJson(element));
       });
     
      return retorno;
    } catch (e, stackTrace) {
      return Future.error(e.toString(), stackTrace);
    }
  }
}
