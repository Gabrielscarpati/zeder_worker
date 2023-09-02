import 'package:zeder/domain/domain.dart';
import 'package:zeder/utils/flutter_get_Location.dart';

import '../firebase/firebase_controller.dart';
import '../shared/name_collections.dart';

class AvaliacaoController {
  GetLocation getLocation = GetLocation();
  final _firebase = FirebaseController();
  final _collection = NameCollections.avaliacoesCollection;

  Future<bool> cadastrarAvaliacao(AvaliacaoPrestadorEntity secao) async {
    try {
      String id = await _firebase.cadastrarDado(
        data: secao,
        collection: _collection,
      );

      await _firebase.atualizarDado(
        data: secao.copyWith(id: id),
        id: id,
        collection: _collection,
      );

      return true;
    } catch (e, stackTrace) {
      return Future.error(
          "Erro ao tentar cadastrar o usuario ${e.toString()}{", stackTrace);
    }
  }

  Future<void> atualizarAvaliacao(AvaliacaoPrestadorEntity secao) async {
    try {
      await _firebase.atualizarDado(
        collection: _collection,
        id: secao.id,
        data: secao,
      );
    } catch (e, stackTrace) {
      return Future.error(
          "Erro ao tentar atualizar o usuario ${e.toString()}{", stackTrace);
    }
  }

  Future<AvaliacaoPrestadorEntity> buscarAvaliacao(String AvaliacaoId) async {
    try {
      final dado = await _firebase.buscarDado(
        collection: _collection,
        id: AvaliacaoId,
      );
      final Avaliacao = AvaliacaoPrestadorEntity.fromJson(dado);
      return Avaliacao;
    } catch (e, stackTrace) {
      return Future.error(e.toString(), stackTrace);
    }
  }

  Future<List<AvaliacaoPrestadorEntity>> buscarAvaliacaoComCondicao(
      String cond, String condName) async {
    List<AvaliacaoPrestadorEntity> retorno = [];
    try {
      final dado = await _firebase.buscarDadoComCondicao(
          collection: _collection, cond: cond, condName: condName);
      dado.forEach((element) {
        retorno.add(AvaliacaoPrestadorEntity.fromJson(element));
      });

      return retorno;
    } catch (e, stackTrace) {
      return Future.error(e.toString(), stackTrace);
    }
  }
}
