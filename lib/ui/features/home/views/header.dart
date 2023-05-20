import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../application/provider/client_provider.dart';
import '../../../widgets/client/client_viewmodel.dart';
import 'dropdown_choose_city.dart';

class Header extends StatefulWidget {
  const Header({Key? key}) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    final ClientProvider _Provider = context.watch<ClientProvider>();
    ClientsViewModel client = _Provider.getClientInfo();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const DropdownChooseCity(),
              GestureDetector(
               child: CircleAvatar(
                    backgroundImage: NetworkImage(client.profile_picture),
                    radius: 20,
                  ),
                onTap: () {

                }
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Hi, ${client.nome}',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
