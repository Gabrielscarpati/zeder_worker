import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zeder/ui/features/home/views/show_worker_cities.dart';
import 'package:zeder/ui/features/home/views/show_worker_services.dart';
import '../../../../application/provider/servico_provider.dart';
import '../../../widgets/client/client_viewmodel.dart';
import '../../user_profile/view/user_profile_screen.dart';

class Header extends StatefulWidget {
  final WorkerViewModel client;
  const Header({Key? key, required this.client}) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    ServicoProvider servicoProvider = Provider.of<ServicoProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Olá, ${widget.client.nome}',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 8,),
              const ShowWorkerCities(),
              const SizedBox(height: 8,),
              const ShowWorkerServices(),
              const SizedBox(height: 8,),
            ],
          ),
          GestureDetector(
              child: Padding(
                padding: const EdgeInsets.only(top: 12,right: 4),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(widget.client.profile_picture),
                  radius: 32,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage(user: widget.client,)),
                );
              }
          ),
        ],
      ),
    );
  }
}
