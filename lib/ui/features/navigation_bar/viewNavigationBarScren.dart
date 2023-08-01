import 'package:flutter/material.dart';
import '../../../application/provider/worker_provider.dart';
import '../../../design_system/widgets/buttons.dart';
import '../../../design_system/widgets/text.dart';
import '../../widgets/client/client_viewmodel.dart';
import 'navigation_bar.dart';

class ViewNavegationBarScreen extends StatefulWidget {
  const ViewNavegationBarScreen({Key? key}) : super(key: key);

  @override
  State<ViewNavegationBarScreen> createState() =>
      _ViewNavegationBarScreenState();
}

class _ViewNavegationBarScreenState extends State<ViewNavegationBarScreen> {
  WorkerProvider workerProvider = WorkerProvider();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: workerProvider.getWorkerLoadDataApp(),
      builder: (BuildContext context, AsyncSnapshot<WorkerViewModel> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(body: Center(child: Container(height: 80, width: 80, child: Center(child: const CircularProgressIndicator()))));
        } else if (snapshot.hasError) {
          return Scaffold(body: Center(child: Container(height: 80, width: 80, child: Center(child: const CircularProgressIndicator()))));
        } else {
          return const NavigationBarScreen();
        }
      },
    );
  }
}

Widget _buildNoInternetWidget(BuildContext context, Widget reloadScreen) {
  return Scaffold(
    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Center(
          child: DSTextSubtitleBoldSecondary(
            text: 'Verifique sua conexão com a internet',
          ),
        ),
        const SizedBox(height: 20),
        DSButtonLargePrimary(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => reloadScreen),
            );
          },
          text: 'Tentar novamente',
        ),
      ],
    ),
  );
}


/*
class ViewNavegationBarScreen extends StatefulWidget {
  const ViewNavegationBarScreen({Key? key}) : super(key: key);

  @override
  State<ViewNavegationBarScreen> createState() =>
      _ViewNavegationBarScreenState();
}

class _ViewNavegationBarScreenState extends State<ViewNavegationBarScreen> {
  WorkerProvider workerProvider = WorkerProvider();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: workerProvider.getWorker(),
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show loading screen while waiting for the future to complete
          return const LoadingScreen();
        } else if (snapshot.hasError) {
          // Handle error if the future throws an exception
          return const ErrorScreen();
        } else {
          // Continue with the actual UI
          return const Placeholder();
        }
      },
    );
  }
}

*/
