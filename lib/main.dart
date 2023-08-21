import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:zeder/design_system/design_system.dart';
import 'package:zeder/ui/features/LogIn/viewLogIn.dart';
import 'package:zeder/ui/features/SignUp/explainCPF/views/bodyExplainCPF.dart';
import 'package:zeder/ui/features/SignUp/list_signup_city/choose_city_screen.dart';
import 'package:zeder/ui/features/SignUp/viewSignUp.dart';
import 'package:zeder/ui/features/home/home_screen.dart';
import 'package:zeder/ui/features/navigation_bar/navigation_bar.dart';
import 'package:zeder/ui/features/navigation_bar/viewNavigationBarScren.dart';
import 'application/provider/adicionais_servico.dart';
import 'application/provider/disputa_provider.dart';
import 'application/provider/home_screen_provider.dart';
import 'application/provider/lead_provider.dart';
import 'application/provider/logInSignUpProvider.dart';
import 'application/provider/pesquisa_cidade_provider.dart';
import 'application/provider/servico_provider.dart';
import 'application/provider/tipo_servico_provider.dart';
import 'application/provider/worker_provider.dart';
import 'data/firebase/firebase_controller.dart';
import 'package:provider/provider.dart';
import 'design_system/widgets/DsFutureBuilder.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyCfogb_y9Sd9ODU2eJxf7X2HxMj6H1g_No",
        authDomain: "zeder-8cd2c.firebaseapp.com",
        projectId: "zeder-8cd2c",
        storageBucket: "zeder-8cd2c.appspot.com",
        messagingSenderId: "520371543372",
        appId: "1:520371543372:web:adbcddabd1ccd6473583e9",
        measurementId: "G-QWLTB813E6"
      ),
    name: 'name',
  );

  

  //final fcmToken = await FirebaseMessaging.instance.getToken();
  //print("FirebaseMessaging token: $fcmToken");
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider( create: (context) => HomeScreenProvider(),),
      ChangeNotifierProvider( create: (context) => PesquisaCidadeProvider(),),
      ChangeNotifierProvider( create: (context) => TipoServicoProvider() ,),
      ChangeNotifierProvider( create: (context) => WorkerProvider() ,),
      ChangeNotifierProvider( create: (context) => ServicoProvider() ,),
      ChangeNotifierProvider( create: (context) => LeadProvider() ,),
      ChangeNotifierProvider( create: (context) => LogInSignUpProvider() ,),
      ChangeNotifierProvider( create: (context) => AdicionaisServicoProvider() ,),
      ChangeNotifierProvider( create: (context) => DisputaProvider() ,),
    ],

    child: const MyApp(),
   ),

  );
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //FirebaseAuth.instance.signOut();
   //print(FirebaseAuth.instance.currentUser);
  /* FirebaseManager manager = FirebaseManager();
     manager.loginUser(email: 'gabrielbrsc30@gmail.com', password: 'Gabriel12', context: context);*/
    return MaterialApp(
          title: 'Flutter Demo',
          theme: DSTheme.theme(context),
      home: DSFutureBuilder<String>(
          future: checkInternetConnectivity(),
          builder: (context, snapshot) {
            if (FirebaseManager().firebaseAuth.currentUser != null) {
              return const ViewNavegationBarScreen();
            }
            return const ViewLogin();
          },
          messageWhenEmpty: "Verifique sua conexão com a internet",
          error: "Verifique sua conexão com a internet",
          reloadScreen: const LoadData(body: MyApp(),) ,
        ),
    );
  }
}

class LoadData extends StatefulWidget {
  final Widget body;
  const LoadData({Key? key, required this.body}) : super(key: key);

  @override
  State<LoadData> createState() => _LoadDataState();
}

class _LoadDataState extends State<LoadData> {
  @override
  Widget build(BuildContext context) {
    PesquisaCidadeProvider pesquisaCidadeProvider = PesquisaCidadeProvider();

    return Scaffold(
      backgroundColor: DSColors.scaffoldBackground,
      body: DSFutureBuilder<String>(
        future: pesquisaCidadeProvider.loadCities(),
        builder: (context, snapshot) {
          return widget.body;
        },
        messageWhenEmpty: "Verifique sua conexão com a internet",
        error: "Verifique sua conexão com a internet",
        reloadScreen: LoadData(body: widget.body,) ,
      ),
    );
  }
}





Future<String> checkInternetConnectivity() async {
  final result = await InternetAddress.lookup('google.com');
  if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
    return 'no internet';
  }
  else{
    return 'internet';
  }

}





