import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zeder/ui/features/user_profile/view/user_profile_screen.dart';

import '../../../application/provider/client_provider.dart';
import '../../widgets/client/client_viewmodel.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late Future<ClientsViewModel> clientFuture;

  @override
  void initState() {
    super.initState();
    final ClientProvider _provider = context.read<ClientProvider>();
    clientFuture = _provider.getClient();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ClientsViewModel>(
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
