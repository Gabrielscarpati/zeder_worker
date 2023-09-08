import '../../utils/flutter_get_Location.dart';
import '../firebase/firebase_controller.dart';
import '../shared/name_collections.dart';

class TermsController {
  final _firebase = FirebaseController();
  final _collection = NameCollections.termsCollection;

  GetLocation getLocation = GetLocation();

  Future<String> buscarWorker() async {
    try {
      final dado = await _firebase.buscarDado(
        collection: _collection,
        id: 'terms_conditions_worker',
      );

      final terms = dado['terms'] as String;
      return terms;
    } catch (e, stackTrace) {
      return Future.error(e.toString(), stackTrace);
    }
  }
}
