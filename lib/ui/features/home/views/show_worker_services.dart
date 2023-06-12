import 'package:flutter/material.dart';
import 'package:zeder/design_system/widgets/icons.dart';
import '../../../../design_system/parameters/colors.dart';
import '../../my_service/select_service_screen.dart';

class ShowWorkerServices extends StatefulWidget {
  const ShowWorkerServices({Key? key}) : super(key: key);

  @override
  State<ShowWorkerServices> createState() => _ShowWorkerServicesState();
}

class _ShowWorkerServicesState extends State<ShowWorkerServices> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 28,
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyServices()),
              );
            },
            splashColor: Colors.transparent,
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(child: Text("What I do ", style: TextStyle(color: DSColors.primary, fontSize: 24, fontWeight: FontWeight.bold),)),
                DSIconPrimary(iconName: 'briefcase'),
                ]
            ),
          ),
        ),
      ],
    );
  }
}
