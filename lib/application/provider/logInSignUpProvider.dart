import 'dart:typed_data';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:zeder/application/provider/pesquisa_cidade_provider.dart';
import 'package:zeder/application/provider/tipo_servico_provider.dart';
import '../../data/firebase/firebase_controller.dart';
import '../../data/user/user_controller.dart';
import '../../data/user/user_entity.dart';
import '../../ui/features/SignUp/list_signup_city/choose_city_screen.dart';
import '../../ui/features/SignUp/save_image.dart';
import '../../ui/features/SignUp/views/widgets/popUpTermsAndConditions.dart';
import '../../ui/features/SignUp/views/widgets/snackbars.dart';
import '../../ui/features/navigation_bar/navigation_bar.dart';
import '../../ui/features/navigation_bar/viewNavigationBarScren.dart';
import '../../ui/widgets/cities/cities_viewmodel.dart.dart';
import '../../ui/widgets/servico_do_app/servico_do_app_viewmodel.dart';

class LogInSignUpProvider with ChangeNotifier {

  static final LogInSignUpProvider provider = LogInSignUpProvider._internal();

  factory LogInSignUpProvider() {
    return provider;
  }
  LogInSignUpProvider._internal();

  bool isChecked = false;
  void updateIsCheck(){
    isChecked = !isChecked;
  }

  Uint8List? image;
   GlobalKey<FormState> formKeyAuthenticationLogin = GlobalKey<FormState>();
   GlobalKey<FormState> formKeyAuthenticationSignUp = GlobalKey<FormState>();
  final RoundedLoadingButtonController btnController = RoundedLoadingButtonController();


  TextEditingController signUpName = TextEditingController();
  TextEditingController signUpPhoneNumber = TextEditingController();
  TextEditingController signUpEmail = TextEditingController();
  TextEditingController signUpPhone = TextEditingController();
  TextEditingController signUpPassword = TextEditingController();
  TextEditingController signUpConfirmPassword = TextEditingController();
  TextEditingController loginEmail = TextEditingController();
  TextEditingController loginPassword = TextEditingController();

  Future<void> selectImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? img = await _picker.pickImage(source: ImageSource.gallery);
    if (img != null) {
      image = await img.readAsBytes();
    }
  }
  Future<String> getUserId() async {
    final User? user = await FirebaseAuth.instance.currentUser;
    final userId = user?.uid.toString();
    return userId!;
  }

  Future<void> signupUser({required String? userId, required String profilePicture}) async {
    WorkerEntity new_user = WorkerEntity(
      id: userId!,
      nome: signUpName.text.trim(),
      email: signUpEmail.text.trim(),
      cpfCnpj: "cpfCnpj ?? this.cpfCnpj",
      tipoPessoa: "tipoPessoa ?? this.tipoPessoa",
      profile_picture: profilePicture,
      phone: signUpPhone.text.trim(),
      servicos: getServicesIds(),
      my_cities: getNameByCities(PesquisaCidadeProvider().selected_cities),
      numberRating1: 0,
      numberRating2: 0,
      numberRating3: 0,
      numberRating4: 0,
      numberRating5: 0,

    );
    await WorkerController().cadastrarWorker(new_user);

    notifyListeners();
  }

  List<String> getNameByCities(List<CitiesViewModel> lista_cidades){
    List<String> cidadeNames = [];
    for(var cidade in lista_cidades){
      cidadeNames.add(cidade.city_name);
    }
    return cidadeNames;
  }


  List<String> getServicesIds(){
    List<String> serviceIds = [];
    List<ServicoDoAppViewModel> servicos= TipoServicoProvider().selected_servicos;
    for (var servico in servicos){
      serviceIds.add(getIdByServices(service: servico.servico));
    }
    return serviceIds;
  }

  String getIdByServices({required String service}){
    if(service == 'Plumber'){
      return '1';
    }else if(service == 'Pest Control'){
      return '2';
    }else if(service == 'Roofing'){
      return '3';
    }else if(service == 'Salon'){
      return '4';
    }
    else if(service == 'Computer Repair'){
      return '5';
    }
    else if(service == 'Ac Repair'){
      return '6';
    }
    return "";
  }


  Future<void> checkConditionsSignUpUser(BuildContext context) async {
      await FirebaseManager().registerUser(
        email: provider.signUpEmail.text.trim(),
        password: provider.signUpPassword.text.trim(),
        context: context,
      );

      String profilePicture = await SaveImage(image: image!, path: 'userUrl', id: await getUserId()).saveAndGetUrl();
      await provider.signupUser(userId: await getUserId(), profilePicture: profilePicture);

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => ViewNavegationBarScreen()),
            (Route<dynamic> route) => false,
      );
    notifyListeners();
  }

  Future<void> goSelectCitiesScreen({required BuildContext context}) async {
    final form = provider.formKeyAuthenticationSignUp.currentState!;

    if(provider.isChecked == false) {
      showDialog(
          context: context,
          builder: (context) => PopUpTermsAndConditions()
      );
    }
    else if( await checkIfEmailInUse(provider.signUpEmail.text.trim()) == false){
      ShowSnackBar(context: context).showErrorSnackBar(message: 'This email is already registered.');
    }
    else if (form.validate()){
      Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return const ChooseCityScreen();
            },
          )
      );
    }
  }

  Future<bool> checkIfEmailInUse(String emailAddress) async {
    try {
      List<String> list = await FirebaseAuth.instance.fetchSignInMethodsForEmail(emailAddress);
      if (list.isEmpty) {
        return true;
      } else {
        return false;
      }
    }catch (error) {
      return true;
    }
  }

  Future<void> loginUser(BuildContext context)async {
    await FirebaseManager().loginUser(
      email: provider.loginEmail.text.trim(),
      password: provider.loginPassword.text.trim(),
      context: context,
    );
  }

  ///// VALIDATORS  /////

  String? validateName(String? value) {
    if (signUpName.text.trim().isEmpty) {
      return "Enter a valid name";
    } else {
      return null;
    }
  }

  String? validatePhone(String? value) {
    if (signUpPhone.text.trim().isEmpty || !RegExp(r'(^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$)').hasMatch(signUpPhone.text.trim())) {
      return "Enter a valid name";
    } else {
      return null;
    }
  }

  String? validateEmail(String? value) {
     if (!EmailValidator.validate(signUpEmail.text.trim())){
       return  'Invalid Email';
     }
     return null;
  }

  String? validatePassword(String? value) {
    if (signUpPassword.text.trim().isEmpty || !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$').hasMatch(signUpPassword.text.trim())) {
      return "Your password must contain an uppercase and\nlowercase letter and a number and at least 8 characters";
    } else {
      return null;
    }
  }


  String? confirmPassword(String? value) {
    if (signUpPassword.text.trim() != signUpConfirmPassword.text.trim()) {
      return "The passwords do not match";
    } else {
      return null;
    }
  }

}


