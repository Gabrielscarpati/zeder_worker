import 'package:zeder/data/user/user_entity.dart';

import '../../domain/entities/servico_entity.dart';
import '../firebase/firebase_controller.dart';
import '../shared/name_collections.dart';

class ServicoController {
  final _firebase = FirebaseController();
  final _collection = NameCollections.servicoCollection;

  Future<bool> cadastrarServico(ServicoEntity servico) async {
    try {
       await _firebase.atualizarDado(
        data: servico,
        id: servico.id,
        collection: _collection,
      );

      return true;
    } catch (e, stackTrace) {
      return Future.error(
          "Erro ao tentar cadastrar o usuario ${e.toString()}{", stackTrace);
    }
  }

  Future<void> atualizarServico(ServicoEntity servico) async {
    try {
      await _firebase.atualizarDado(
        collection: _collection,
        id: servico.id,
        data: servico,
      );
    } catch (e, stackTrace) {
      return Future.error(
          "Erro ao tentar atualizar o usuario ${e.toString()}{", stackTrace);
    }
  }

  Future<ServicoEntity> buscarServico(String servicoId) async {
    try {
      final dado = await _firebase.buscarDado(
        collection: _collection,
        id: servicoId,
      );
      final servico = ServicoEntity.fromJson(dado);
      return servico;
    } catch (e, stackTrace) {
      return Future.error(e.toString(), stackTrace);
    }
  }

  Future<List<ServicoEntity>> buscarServicoComCondicao({required String cond, required String condName })async{
    List<ServicoEntity> retorno = [];
    try {
      final dado = await _firebase.buscarDadoComCondicao(collection: _collection, cond: cond,  condName: condName  );
      //final response = await _db.collection('servico').where('idTipoServico', isEqualTo: '1').get();
      dado.forEach((element) {
        retorno.add(ServicoEntity.fromJson(element));
       });
     
      return retorno;
    } catch (e, stackTrace) {
      return Future.error(e.toString(), stackTrace);
    }
  }
}
