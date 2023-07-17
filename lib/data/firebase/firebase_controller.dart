import 'dart:io';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/framework/entity.dart';
import '../../ui/features/SignUp/views/widgets/snackbars.dart';
import '../../ui/features/navigation_bar/viewNavigationBarScren.dart';

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

  Future<List<Map<String, dynamic>>> buscarTodosDados({required String collection}) async {
    if (collection.isEmpty) {
      throw ArgumentError("Nome da coleção inválido");
    }
    try {
      final response = await _db.collection(collection).get();
      final documents = response.docs;

      if (documents.isNotEmpty) {
        return documents.map((doc) => doc.data()).toList();
      }
      throw Exception("Não há dados na coleção $collection");
    } catch (e, stackTrace) {
      throw Exception(e.toString());
    }
  }


  Future<List<Map<String, dynamic>>> buscarDadoComCondicao({required String collection, required String condName,required String cond}) async {
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


/*  Future<void> atualizarDadoComCondicao(
      {String collection = '', String id = '', Entity? data}) async {
    if (data == null || id.isEmpty || collection.isEmpty) {
      return Future.error("Dados Inválidos para atualizar", StackTrace.current);
    }
    try {
      var json = data.toJson();
      json["update_at"] = DateTime.now();
      await _db.collection(collection).where("id", isEqualTo: "1112xv").get().then((snapshot) {
        if (snapshot.docs.isNotEmpty) {
          snapshot.docs.first.reference.set(json, SetOptions(merge: true));
        } else {
          // Handle the case when no document with the given id is found
        }
      });
    } catch (e, stackTrace) {
      return Future.error(e.toString(), stackTrace);
    }
  }*/


  Future<void> atualizarDado({String collection = '', String id = '', Entity? data}) async {
    if (data == null || id.isEmpty || collection.isEmpty) {
      return Future.error("Dados Inváidos para atualizar", StackTrace.current);
    }
    try {
      var json = data.toJson();
      json["update_at"] = Timestamp.now();
      await _db.collection(collection).doc(id).set(json, SetOptions(merge: true) );
    } catch (e, stackTrace) {
      return Future.error(e.toString(), stackTrace);
    }
  }


  Future<void> atualizarDadosEspecificos({String collection = '', String id = '', Map<String, Object>? data}) async {
    if (data == null || id.isEmpty || collection.isEmpty) {
      return Future.error("Dados Inváidos para atualizar", StackTrace.current);
    }
    try {
      data['update_at'] = Timestamp.now();
      await _db.collection(collection).doc(id).update(data);
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
    return buffer.toString();
  }


}


/////////////////////////  AUTH  /////////////////////////////

class FirebaseManager{

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<String> getUserCurrentID() async{
    return firebaseAuth.currentUser!.uid;
  }

  Future<User?> registerUser ({required String email, required String password, required BuildContext context}) async {
    try {
      UserCredential userCredential = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      await loginUser(email: email, password: password, context: context);
      return userCredential.user;
    } on FirebaseAuthException catch(e){
      print(e);
    } catch (e){
      print(e);
    }
    return null;
  }

  Future<User?> loginUser ({required String email, required String password, required BuildContext context}) async {
    try {
      UserCredential userCredential = await firebaseAuth.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ViewNavegationBarScreen()),
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ShowSnackBar(context: context).showErrorSnackBar(message: 'Não existe usuário com esse email.');
      } else if (e.code == 'wrong-password') {
        ShowSnackBar(context: context).showErrorSnackBar(message: 'Senha errada para esse email');
      }else if (e.code == 'too-many-requests') {
        ShowSnackBar(context: context).showErrorSnackBar(message: 'Espere um pouco e tente novamente');
      }
    }
    return null;
  }

   signOut()  {
    try {
      return  firebaseAuth.signOut();

    } catch(e){
      print(e.toString());
      return null;
    }
  }

  Future resetPassword({required String email, required BuildContext context }) async{
    bool doesEmailExists = await checkIfEmailInUse(email);
    if(!doesEmailExists){
      ShowSnackBar(context: context).showErrorSnackBar(message: 'O email não está cadastrado.');
    }
    else{
      await firebaseAuth.sendPasswordResetEmail(email: email);
    }
  }

  Future<bool> checkIfEmailInUse(String emailAddress) async {
    try {
      List<String> list = await FirebaseAuth.instance.fetchSignInMethodsForEmail(emailAddress);
      if (list.isEmpty) {
        return false;
      } else {
        return true;
      }
    }catch (error) {
      return true;
    }
  }
}
