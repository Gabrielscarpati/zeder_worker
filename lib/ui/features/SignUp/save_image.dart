import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';

class SaveImage {
  Uint8List image;
  String id;
  String path;

  final storageRef = FirebaseStorage.instance.ref();
  final _db = FirebaseFirestore.instance;

  SaveImage({required this.image, required this.path, required this.id});


  Future<String> saveAndGetUrl() async{

    final imageRef = storageRef.child(id + "/"+path );

    String url = "";
    try{
      // final blob = await image.readAsString();
      await imageRef.putData(image, SettableMetadata(
        contentType: "image/jpeg",
      ));
      url = await imageRef.getDownloadURL();


    } catch(e){
      rethrow;
    }

    return url;
  }
}