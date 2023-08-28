import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sendgrid_mailer/sendgrid_mailer.dart';
import 'package:zeder/design_system/design_system.dart';

import 'application/provider/adicionais_servico.dart';
import 'application/provider/disputa_provider.dart';
import 'application/provider/home_screen_provider.dart';
import 'application/provider/lead_provider.dart';
import 'application/provider/logInSignUpProvider.dart';
import 'application/provider/pesquisa_cidade_provider.dart';
import 'application/provider/servico_provider.dart';
import 'application/provider/tipo_servico_provider.dart';
import 'application/provider/worker_provider.dart';
import 'design_system/widgets/DsFutureBuilder.dart';

//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
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
        measurementId: "G-QWLTB813E6"),
    name: 'name',
  );

  //final fcmToken = await FirebaseMessaging.instance.getToken();
  //print("FirebaseMessaging token: $fcmToken");
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeScreenProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PesquisaCidadeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TipoServicoProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => WorkerProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ServicoProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => LeadProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => LogInSignUpProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AdicionaisServicoProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DisputaProvider(),
        ),
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
      home: /*DSFutureBuilder<String>(
        future: checkInternetConnectivity(),
        builder: (context, snapshot) {
          if (FirebaseManager().firebaseAuth.currentUser != null) {
            return const ViewNavegationBarScreen();
          }
          return const ViewLogin();
        },
        messageWhenEmpty: "Verifique sua conexão com a internet",
        error: "Verifique sua conexão com a internet",
        reloadScreen: const LoadData(
          body: MyApp(),
        ),
      ),*/
          Scaffold(
        body: Center(
          child: Container(
            height: 100,
            width: 100,
            color: Colors.red,
            child: InkWell(
              onTap: () {
                sendEmail();
              },
              child: Text('Enviar email'),
            ),
          ),
        ),
      ),
    );
  }

  sendEmail() async {
    final mailer = Mailer(
        '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');
    final toAddress = Address('gabrielbrsc15@gmail.com');
    final fromAddress = Address('housieaplicativo@gmail.com');

    final subject = 'Hello Subjectad imha nossa muilto lega!';
    final personalization = Personalization([toAddress]);

    final email = Email([personalization], fromAddress, subject,
        content: [
          const Content(
            'text/plain',
            'Hello Subjectad imha nossa muilasx  as d asd a sd as das adsasasd  asasadsdas asd asd sa asdsdsasdasad  asdasdasdasdasd  asdadssadsadasdasd asdasdasdads asd asd asd ads ads asd ads ads ads asd ads ad to lega!',
          )
        ]);
    mailer.send(email).then((result) {
      print(result.isValue);
    });
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
        reloadScreen: LoadData(
          body: widget.body,
        ),
      ),
    );
  }
}

Future<String> checkInternetConnectivity() async {
  final result = await InternetAddress.lookup('google.com');
  if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
    return 'no internet';
  } else {
    return 'internet';
  }
}
