import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../application/provider/client_provider.dart';
import '../../../widgets/client/client_viewmodel.dart';
import '../../user_profile/view/user_profile_screen.dart';
import 'dropdown_choose_city.dart';

class Header extends StatefulWidget {
  final ClientsViewModel client;
  const Header({Key? key, required this.client}) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const DropdownChooseCity(),
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
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Hi, ${widget.client.nome}',
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
