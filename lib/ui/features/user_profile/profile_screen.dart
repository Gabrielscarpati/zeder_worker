import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zeder/ui/features/user_profile/view/user_profile_screen.dart';
import '../../../application/provider/worker_provider.dart';
import '../../widgets/client/client_viewmodel.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late Future<WorkerViewModel> clientFuture;

  @override
  void initState() {
    super.initState();
    final WorkerProvider _provider = context.read<WorkerProvider>();
    clientFuture = _provider.getWorker();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WorkerViewModel>(
      future: clientFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return ProfilePage(user: snapshot.data!,);
        }
      },
    );
  }
}
