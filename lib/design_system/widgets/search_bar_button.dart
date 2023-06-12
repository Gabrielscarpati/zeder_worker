import 'package:flutter/material.dart';

import '../../ui/features/my_service/select_service_screen.dart';
import '../parameters/colors.dart';

class SearchBarButton extends StatefulWidget {
  const SearchBarButton({Key? key}) : super(key: key);

  @override
  State<SearchBarButton> createState() => _SearchBarButtonState();
}

class _SearchBarButtonState extends State<SearchBarButton> {
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MyServices()),
          );        },
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0), // Adjust the border radius as per your preference
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(DSColors.cardColor), // Set the background color to white

        ),
        child: const Padding(
          padding: EdgeInsets.all(4.0),
          child: Row(
            children: [
              Icon(
                Icons.search,
                size: 30.0,
                color: DSColors.tertiary,
              ),
              SizedBox(width: 12,),
              Text('Search service', style: TextStyle(color: DSColors.tertiary),),
            ],
          ),
        ),
      ),
    );
  }
}
