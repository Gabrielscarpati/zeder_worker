import 'package:zeder/domain/domain.dart';

import '../../utils/flutter_get_Location.dart';
import '../firebase/firebase_controller.dart';
import '../shared/name_collections.dart';

class ListCitiesBrazilController {
  final _firebase = FirebaseController();
  final _collection = NameCollections.listCitiesBrazil;
  GetLocation getLocation = GetLocation();

  Future<bool> cadastrarCidade(CityEntity city) async {
    try {
      await _firebase.atualizarDado(
        data: city,
        id: city.id,
        collection: _collection,
      );

      return true;
    } catch (e, stackTrace) {
      return Future.error(
          "Erro ao tentar cadastrar o usuario ${e.toString()}{", stackTrace);
    }
  }

  Future<void> atualizarWorker(CityEntity city) async {
    try {
      await _firebase.atualizarDado(
        collection: _collection,
        id: city.id,
        data: city,
      );
    } catch (e, stackTrace) {
      return Future.error(
          "Erro ao tentar atualizar o usuario ${e.toString()}{", stackTrace);
    }
  }

  Future<CityEntity> buscarCidade(String cityId) async {
    try {
      final dado = await _firebase.buscarDado(
        collection: _collection,
        id: cityId,
      );
      final city = CityEntity.fromJson(dado);
      return city;
    } catch (e, stackTrace) {
      return Future.error(e.toString(), stackTrace);
    }
  }

  Future<List<CityEntity>> buscarCidadeComCondicao(
      {required String cond, required String condName}) async {
    List<CityEntity> retorno = [];
    try {
      final dado = await _firebase.buscarDadoComCondicao(
          collection: _collection, cond: cond, condName: condName);
      dado.forEach((element) {
        retorno.add(CityEntity.fromJson(element));
      });

      return retorno;
    } catch (e, stackTrace) {
      return Future.error(e.toString(), stackTrace);
    }
  }
}
