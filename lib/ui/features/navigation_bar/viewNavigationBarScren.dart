import 'package:flutter/material.dart';
import '../../../application/provider/worker_provider.dart';
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
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          print("Esperando ");
          return Scaffold(body: Container(height: 80, width: 80, child: Center(child: const CircularProgressIndicator())));
        } else if (snapshot.hasError) {
          return Scaffold(body: Container(height: 80, width: 80, child: Center(child: const CircularProgressIndicator())));
        } else {
          // Continue with the actual UI
          return const NavigationBarScreen();
        }
      },
    );
  }
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
