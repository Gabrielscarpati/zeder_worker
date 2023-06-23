import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:zeder/application/provider/logInSignUpProvider.dart';
import 'package:zeder/design_system/design_system.dart';
import 'package:zeder/design_system/ds_app_bar.dart';
import 'package:zeder/ui/features/SignUp/explainProofOfResidency/explainProofOfResidencyScreen.dart';
import 'package:zeder/ui/features/home/Widgets/pop_up_explain_names_home_screen.dart';
import '../../../LoadingButton.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'dart:io';
import 'package:path/path.dart';

class BodyGetUserCPF extends StatefulWidget{


  const BodyGetUserCPF({Key? key,}) : super(key: key);
  @override
  _BodyGetUserCPFState createState() => _BodyGetUserCPFState();
}
class _BodyGetUserCPFState extends State<BodyGetUserCPF> {
  RoundedLoadingButtonController _btnController = RoundedLoadingButtonController();

  final FirebaseAuth auth = FirebaseAuth.instance;
  Future<String?> getUserId() async {
    final User? user = await auth.currentUser;
    final userId = user?.uid.toString();
    return userId;
  }
  final firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;

  File? _photo;
  final ImagePicker _picker = ImagePicker();

  Future imgFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _photo = File(pickedFile.path);
        uploadFile();
      } else {
      }
    });
  }

  Future imgFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _photo = File(pickedFile.path);
        uploadFile();
      } else {
        print('No image selected.');
      }
    });
  }

  Future uploadFile() async {
    if (_photo == null) return;
    final fileName = basename(_photo!.path);
    final destination = 'PictureCPFWorker/$fileName';

    try {
      final ref = firebase_storage.FirebaseStorage.instance.ref(destination).child('PictureCPFWorker/');
      await ref.putFile(_photo!);
    } catch (e) {
      print('error occurred');
    }
    return _photo!.path;
  }

    Future<String> getUrlToImageFirebase() async {
    Reference ref = storage.ref().child(basename(_photo!.path) + DateTime.now().toString());
    await ref.putFile(File(_photo!.path));
    String imageUrl = await ref.getDownloadURL();
     return imageUrl.toString();
  }
  final formKeyAuthentication = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final LogInSignUpProvider provider = context.watch<LogInSignUpProvider>();
    return Scaffold(
      appBar: const DSAppBar(title: 'Documentos',),
      body: SizedBox(
        width: double.infinity,
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                color: DSColors.scaffoldBackground,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        const DSTextTitleBoldSecondary(
                          text: 'Clique no lapis para escolher\numa imagem do seu RG,'
                        ),
                        const SizedBox(
                           height: 20,
                         ),
                         Padding(
                          padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                          child: Stack(
                            children: [
                               Center(
                                  child:GestureDetector(
                                    onTap: () {
                                      _showPicker(context);
                                    },
                                      child: _photo != null
                                          ? ClipRRect(
                                              borderRadius: BorderRadius.circular(0),
                                              child: Image.file(
                                                _photo!,
                                                width:250,
                                                height: 323,
                                                fit: BoxFit.fitHeight,
                                              ),
                                            )
                                          : Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(0)),
                                                  width: 250,
                                                  height: 323,
                                                  child: Icon(
                                                    Icons.camera_alt,
                                                    size: 40,
                                                    color: Colors.grey[600],
                                        ),
                                      ),

                                  ),
                                ),
                            ],
                          ),
                        ),
                        Form(
                          key: formKeyAuthentication,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LoadingButton(
          goNextScreen:() async {
            final form = formKeyAuthentication.currentState!;
            if(await uploadFile() == null){
              mostrarErroSelecioneUmaFoto(context);
            } else if (form.validate()) {
              provider.cpfPicture = await getUrlToImageFirebase();
              {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                  const ExplainProofOfResidencyScreen(),
                )
                );
              }
            }
            _btnController.reset();
          },
          buttonText: "CONTINUAR (5/6)",
          controller: _btnController,
        ),
      ),
    );
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child:  Wrap(
                children: <Widget>[
                   ListTile(
                      leading:  Icon(Icons.photo_library),
                      title:  Text('Gallery'),
                      onTap: () {
                        imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                   ListTile(
                    leading:  Icon(Icons.photo_camera),
                    title:  Text('Camera'),
                    onTap: () {
                      imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
  Future mostrarErroSelecioneUmaFoto(context) => showDialog(
    context: context,
    builder: (context) => PopUpExplainNameHomeScreen(title: "Por favor, selecione uma foto"),
  );
}
