import 'dart:convert';
import '../firebase/firebase_controller.dart';
import '../shared/name_collections.dart';

class PathController {
  final _firebase = FirebaseController();
  final _collection = NameCollections.pathFindServicoCollection;

  void printLongString(String text) {
    final RegExp pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
    pattern.allMatches(text).forEach((RegExpMatch match) =>   print(match.group(0)));
  }

  Future<void > buscarPath() async {
    try {
      final dado = await _firebase.buscarDado(
        collection: _collection,
        id: '1',
      );
      String json = jsonEncode(dado['map_path']);
      print(json.length);

      //printLongString(json);
      //print(dado);
      Map<String, dynamic> jsonReturn =  jsonDecode(dado['map_path']);
      jsonReturn.forEach((key, value) {
        print('$key: $value');
      });

      print(jsonReturn);
      //return jsonReturn;
    } catch (e, stackTrace) {
     // return Future.error(e.toString(), stackTrace);
    }
  }
}






