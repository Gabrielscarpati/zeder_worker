import 'dart:io';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:zeder/domain/domain.dart';
import '../../application/provider/worker_provider.dart';
import '../../core/framework/entity.dart';
import '../../core/utils/bool_utils.dart';
import '../../core/utils/date_utils.dart';
import '../../ui/widgets/client/client_viewmodel.dart';
import '../../ui/widgets/servico/servico_viewmodel.dart';

class FirebaseController {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final storageRef = FirebaseStorage.instance.ref();
final auth = FirebaseAuth.instance;

// FUNCOES UTEIS PADRAO

User? getCurrentUser(){
  return auth.currentUser;
}

Future<void> SavePdfFile(File file, String id, ) async{
  
  try {
    int number = Random().nextInt(100);
    final fileRef = storageRef.child(id+"/"+number.toString() + ".pdf");
    await fileRef.putData(file.readAsBytesSync());
  } catch(e){
    return Future.error(e, StackTrace.current);
  }
}

Future<List<String>> getFilesFromPath(String id) async{
  List<String> files = [];
  try {
    final fileRef = storageRef.child(id);
    final list = await fileRef.listAll();
    for (var item in list.items) {
      
      final url = await item.getDownloadURL();
      
      files.add(url);
    }
  } catch(e){
    return Future.error(e, StackTrace.current);
  }
  return files;
}

Future<String> salvarImagemEReceberURL(Uint8List image, {String id = '', String path = '', String collection = ''})async{

  if (collection.isEmpty || id.isEmpty || path.isEmpty) {
      return Future.error("Dados Inváidos para salvar", StackTrace.current);
    }

  final imageRef = storageRef.child(id + "/"+path );


    try{
     // final blob = await image.readAsString();
       await imageRef.putData(image, SettableMetadata(
      contentType: "image/jpeg",
  ));

  
      String url = await imageRef.getDownloadURL();
      
      
      return url;  
    } catch(e){
        return Future.error(e, StackTrace.current);
    }
}


  Future<List<Map<String, dynamic>>> buscarCollection(
      {String collection = ''}) async {
    if (collection.isEmpty) {
      return Future.error("Dados Inváidos para buscar", StackTrace.current);
    }
    List<Map<String, dynamic>> list = [];
    try {
      await _db.collection(collection).get().then((event) {
        for (var doc in event.docs) {
          list.add(doc.data());
        }
      });
      return list;
    } catch (e, stackTrace) {
      return Future.error(e.toString(), stackTrace);
    }
  }

  Future<Map<String, dynamic>> buscarDado(
      {String collection = '', String id = ''}) async {
    if (id.isEmpty || collection.isEmpty) {
      return Future.error("Dados Inváidos para buscar", StackTrace.current);
    }
    try {
      final response = await _db.collection(collection).doc(id).get();
      if (response.exists && response.data() != null) {
        return response.data()!;
      }
      return Future.error(
          "Dado não encontrado em $collection", StackTrace.current);
    } catch (e, stackTrace) {
      return Future.error(e.toString(), stackTrace);
    }
  }


  Future<List<Map<String, dynamic>>> buscarDadoComCondicao({required String collection, required String condName,required String cond}) async {
    print("collection: $collection, condName: $condName, cond: $cond");
  if (cond.isEmpty || collection.isEmpty) {
      return Future.error("Dados Inváidos para buscar", StackTrace.current);
    }
    try {
      List<Map<String, dynamic>> res = [];
      final response = await _db.collection(collection).where(condName, isEqualTo: cond).get();

      //final response = await _db.collection(collection).where(condName, isEqualTo: cond).get();
      response.docs.forEach((element) { 
        if (element.exists && element.data() != null) {
        res.add(element.data());
      }
       });
     
        return res;
      
    
    } catch (e, stackTrace) {
      return Future.error(e.toString(), stackTrace);
    }
  }

  Future<void> atualizarDado(
      {String collection = '', String id = '', Entity? data}) async {
    if (data == null || id.isEmpty || collection.isEmpty) {
      return Future.error("Dados Inváidos para atualizar", StackTrace.current);
    }
    try {
      var json = data.toJson();
      json["update_at"] = DateTime.now();
      await _db.collection(collection).doc(id).set(json, SetOptions(merge: true) );
    } catch (e, stackTrace) {
      return Future.error(e.toString(), stackTrace);
    }
  }

  Future<void> deletarDado(
      {String collection = '', String id = ''}) async {
    if (id.isEmpty || collection.isEmpty) {
      return Future.error("Dados Inváidos para atualizar", StackTrace.current);
    }
    try {
     
    
      await _db.collection(collection).doc(id).delete();
    } catch (e, stackTrace) {
      return Future.error(e.toString(), stackTrace);
    }
  }

  Future<String> cadastrarDado({Entity? data, String? collection}) async {
    if (data == null || collection == null || collection.isEmpty) {
      return Future.error("Dados Inváidos para cadastrar", StackTrace.current);
    }
    try {
      var json = data.toJson();
      json["create_at"] = DateTime.now();
      final response = await _db.collection(collection).add(json);
      return response.id;
    } catch (e, stackTrace) {
      return Future.error("Erro ao tentar Cadastrar", stackTrace);
    }
  }

  String getRandomGeneratedId() {
    const int AUTO_ID_LENGTH = 20;
    const String AUTO_ID_ALPHABET = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';

    const int maxRandom = AUTO_ID_ALPHABET.length;
    final Random randomGen = Random();

    final StringBuffer buffer = StringBuffer();
    for (int i = 0; i < AUTO_ID_LENGTH; i++) {
      buffer.write(AUTO_ID_ALPHABET[randomGen.nextInt(maxRandom)]);
    }
    print(buffer.toString());
    return buffer.toString();
  }


}


/////////////////////////  AUTH  /////////////////////////////

class FirebaseManager{

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<String> getUserCurrentID() async{
    return firebaseAuth.currentUser!.uid;
  }

  Future<User?> registerUser ({required String email, required String password}) async {
    try {
      UserCredential userCredential = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      await loginUser(email: email, password: password);
      return userCredential.user;
    } on FirebaseAuthException catch(e){
      print(e);
    } catch (e){
      print(e);
    }
    return null;
  }

  Future<User?> loginUser ({required String email, required String password}) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
    return null;
  }

  Future signOut() async {
    try {
      return await firebaseAuth.signOut();

    } catch(e){
      print(e.toString());
      return null;
    }
  }
}

/*
Future<List<ServicoViewModel>> fetchServicos() async {
  FirebaseController firebaseController = FirebaseController();
  final snapshot = await FirebaseFirestore.instance.collection('servico').get();
  List<ServicoViewModel> servicos = [];
  for (var doc in snapshot.docs) {
    Map<String, dynamic> data = doc.data();
    servicos.add(ServicoViewModel(
      id: data['id'],
      dataPropostaFeita: DateUtil.toDateTimeDefaultDateZero(data['id']).toString().substring(0,5),
      dataPropostaAceita: DateUtil.toDateTimeDefaultDateZero(data['id']).toString().substring(0,5),
      dataPagamento: DateUtil.toDateTimeDefaultDateZero(data['id']).toString().substring(0,5),
      clientGivenDate: DateUtil.toDateTimeDefaultDateZero(data['id']).toString().substring(0,5),
      descricao: data['descricao'] ?? '',
      flgClientSaw: BoolUtil.toBoolDefaultFalse(data['flgClientSaw']),
      flgWorkerSaw: BoolUtil.toBoolDefaultFalse(data['flgWorkerSaw']),
      icone: data['icone'] ?? '',
      idCity: data['idCity'] ?? '',
      idClient: data['idClient'] ?? '',
      idDisputa: data['idDisputa'] ?? '',
      idWorker: data['idWorker'] ?? '',
      idAcceptedLead: data['idAcceptedLead'] ?? '',
      idsWorkersBid: data['idsWorkersBid'] ?? [],
      serviceDetails: data['serviceDetails'] ?? {},
      service: data['service'] ?? '',
      idService: data['idService'] ?? '',
      smallerValue: data['smallerValue'] ?? '',
      greaterValue: data['greaterValue'] ?? '',
      acceptedValue: data['acceptedValue'] ?? '',
      areThereBids: BoolUtil.toBoolDefaultFalse(data['areThereBids']),
      clientAcceptedABid: BoolUtil.toBoolDefaultFalse(data['clientAcceptedABid']),
      waitingPayment: BoolUtil.toBoolDefaultFalse(data['waitingPayment']),
      payed: BoolUtil.toBoolDefaultFalse(data['payed']),
      doing: BoolUtil.toBoolDefaultFalse(data['doing']),
      concluded: BoolUtil.toBoolDefaultFalse(data['concluded']),
      emDisputa: BoolUtil.toBoolDefaultFalse(data['emDisputa']),
      reembolsado: BoolUtil.toBoolDefaultFalse(data['reembolsado']),
      disputaFinalizada: BoolUtil.toBoolDefaultFalse(data['disputaFinalizada']),
      )
    );
  }
  String userId = firebaseController.getCurrentUser()!.uid;
  WorkerViewModel worker = await WorkerProvider().getWorker();
  List<dynamic> worker_servicos_ids = worker.my_services;
  print('aaaaaaaa');

  print(worker_servicos_ids);
  for(var id in worker_servicos_ids){
    servicos.removeWhere((service) => service.idService != id);

*/
/*    for(var service in servicos ){
      if(service.idService != id){
        service.
      }
    }*//*

  }
  servicos.clear();

  return servicos;
}
*/



/////////////////////////  Stream  /////////////////////////////
/*abstract class IModel<T>{
  Map<String, dynamic> toJson();


  // IModel fromJson(Map<String, dynamic> json);
  DateTime parseDateTime(String? dateTime) {
    if (dateTime == null) return DateTime.now();
    final date = DateTime.tryParse(dateTime);
    if (date == null) return DateTime.now();
    return date;
  }

  T fromJson(Map<String, dynamic> json);
}*/

/*class GetDataStream<B extends Entity> {
  B entity;
  String collection = '';

  GetDataStream({required this.entity, required this.collection});

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<List<B>> getBasicStream() {
    try {
      return _db.collection(collection).snapshots().map((notes) {
        final List<B> notesFromFirestore = <B>[];
        for (final DocumentSnapshot<Map<String, dynamic>> doc in notes.docs) {
          notesFromFirestore.add(entity.fromJson(doc.data()!));
        }
        return notesFromFirestore;
      });
    } catch (e) {
      rethrow;
    }
  }

  Stream<List<B>> getStreamWithAtribute(String atribute, String value) {
    try {
      return _db
          .collection(collection)
          .where(atribute, isEqualTo: value)
          .snapshots()
          .map((notes) {
        final List<B> notesFromFirestore = <B>[];
        for (final DocumentSnapshot<Map<String, dynamic>> doc in notes.docs) {
          notesFromFirestore.add(entity.fromJson(doc.data()!));
        }
        return notesFromFirestore;
      });
    } catch (e) {
      rethrow;
    }
  }
}*/



