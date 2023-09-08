import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zeder/application/provider/pesquisa_cidade_provider.dart';
import 'package:zeder/application/provider/tipo_servico_provider.dart';
import 'package:zeder/data/user/user_controller.dart';
import 'package:zeder/domain/domain.dart';
import 'package:zeder/ui/widgets/client/client_viewmodel.dart';

import '../../data/firebase/firebase_controller.dart';
import '../../data/user/user_entity.dart';
import '../../design_system/parameters/colors.dart';
import '../../ui/features/SignUp/save_image.dart';
import '../../ui/features/SignUp/views/widgets/snackbars.dart';
import '../../ui/features/navigation_bar/navigation_bar.dart';
import '../../ui/widgets/cities/cities_viewmodel.dart.dart';
import '../../ui/widgets/worker_services/worker_services_viewmodel.dart';
import '../../utils/flutter_get_Location.dart';

class WorkerProvider with ChangeNotifier {
  static final WorkerProvider provider = WorkerProvider._internal();

  factory WorkerProvider() {
    return provider;
  }

  WorkerProvider._internal();

  List get_servicos({required List servicos}) {
    return servicos;
  }

  FirebaseController firebaseController = FirebaseController();

  List<CitiesViewModel> my_cities = [];
  List<WorkerServicesViewModel> my_services = [];
  String profilePicturePath = '';
  String workerId = '';
  GetLocation getLocation = GetLocation();

  Future<WorkerViewModel> getWorkerLoadDataApp() async {
    PesquisaCidadeProvider tipoServicoProvider = PesquisaCidadeProvider();
    await tipoServicoProvider.loadCities();

    WorkerEntity workerEntity = await WorkerController()
        .buscarWorker(firebaseController.getCurrentUser()!.uid);

    WorkerViewModel workerViewModel = WorkerViewModel(
      nome: workerEntity.nome,
      email: workerEntity.email,
      cpfCnpj: workerEntity.cpfCnpj,
      tipoPessoa: workerEntity.tipoPessoa,
      profile_picture: workerEntity.profile_picture,
      phone: workerEntity.phone,
      servicos_id: workerEntity.servicos,
      my_cities: workerEntity.my_cities,
      my_services: workerEntity.servicos,
    );
    workerId = workerEntity.id;
    profilePicturePath = workerViewModel.profile_picture;
    get_servicos(servicos: workerEntity.servicos);
    my_cities.clear();
    my_services.clear();

    for (int i = 0; i < workerViewModel.my_services.length; i++) {
      my_services.add(WorkerServicesViewModel(
          icone: 'city',
          servico: getServicesByID(id: workerViewModel.my_services[i])));
    }
    for (int i = 0; i < workerViewModel.my_cities.length; i++) {
      my_cities.add(CitiesViewModel(
          icon: 'city',
          name: getCitiesByID(id: workerViewModel.my_cities[i]),
          id: workerViewModel.my_cities[i]));
    }
    return workerViewModel;
  }

  String getServicesByID({required String id}) {
    TipoServicoProvider tipoServicoProvider = TipoServicoProvider();
    List<TipoServicoEntity> servicos = tipoServicoProvider.getListServices();
    for (TipoServicoEntity servico in servicos) {
      if (servico.id == id) {
        return servico.name;
      }
    }
    return 'String';
  }

  String getCitiesByID({required String id}) {
    PesquisaCidadeProvider pesquisaCidadeProvider = PesquisaCidadeProvider();
    List<CityEntity> cities = pesquisaCidadeProvider.getAllCities();
    for (CityEntity city in cities) {
      if (city.id == id) {
        return city.name;
      }
    }
    return 'Str';
  }

  String getCurrentUserProfilePicture() {
    return profilePicturePath;
  }

  final ImagePicker picker = ImagePicker();
  File? photoFile;

  void setPhotoFileNull() {
    photoFile = null;
    notifyListeners();
  }

  Future imgFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      photoFile = File(pickedFile.path);
      notifyListeners();
    } else {}
  }

  Future imgFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      photoFile = File(pickedFile.path);
      notifyListeners();
    } else {
      print('No image selected.');
    }
  }

  void showImagePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.image),
                title: const Text('Gallery'),
                onTap: () {
                  imgFromGallery();
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera),
                title: const Text('Camera'),
                onTap: () async {
                  imgFromCamera();
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<Uint8List> convertFileToUint8List(File file) async {
    List<int> bytes = await file.readAsBytes();
    return Uint8List.fromList(bytes);
  }

  Future<String> updateUserImage({required BuildContext context}) async {
    if (photoFile == null) {
      Navigator.of(context).pop();
    }
    String profilePicture = await SaveImage(
            image: await convertFileToUint8List(photoFile!),
            path: 'userUrl',
            id: await FirebaseManager().getUserCurrentID())
        .saveAndGetUrl();
    await WorkerController().atualizarWorkerPicture(
        await WorkerController()
            .buscarWorker(firebaseController.getCurrentUser()!.uid),
        profilePicture);
    photoFile = null;
    ShowSnackBar(context: context).showErrorSnackBar(
        message: getLocation.locationBR
            ? 'A imagem foi atualizada com sucesso'
            : "Image successfully updated",
        color: DSColors.secondary);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const NavigationBarScreen()),
    );
    return profilePicture;
  }
}
