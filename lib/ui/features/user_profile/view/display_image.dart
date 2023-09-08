import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zeder/application/provider/worker_provider.dart';
import 'package:zeder/design_system/design_system.dart';
import 'package:zeder/utils/flutter_get_Location.dart';

class DisplayImage extends StatefulWidget {
  const DisplayImage({
    Key? key,
  }) : super(key: key);

  @override
  State<DisplayImage> createState() => _DisplayImageState();
}

class _DisplayImageState extends State<DisplayImage> {
  @override
  Widget build(BuildContext context) {
    WorkerProvider userProvider = context.watch<WorkerProvider>();
    userProvider.getCurrentUserProfilePicture();

    if (userProvider.photoFile != null) {
      setState(() {
        userProvider.profilePicturePath = userProvider.photoFile!.path;
      });
    }

    GetLocation getLocation = GetLocation();
    return SizedBox(
      width: 170,
      height: 170,
      child: Center(
          child: InkWell(
        child: Stack(children: [
          userProvider.profilePicturePath == ''
              ? Container(
                  width: 140,
                  height: 140,
                  decoration: const BoxDecoration(
                      color: DSColors.tertiary,
                      borderRadius: BorderRadius.all(Radius.circular(70))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Transform.scale(
                        scale: 3,
                        child: InkWell(
                          onTap: () {
                            userProvider.showImagePicker(context);
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(3.0),
                            child: DSIconSmallSecondary(
                              iconName: 'account',
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        getLocation.locationBR
                            ? 'Adicione uma foto'
                            : 'Add a photo',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                )
              : userProvider.profilePicturePath.substring(0, 6) == 'https:'
                  ? CircleAvatar(
                      backgroundImage:
                          NetworkImage(userProvider.profilePicturePath),
                      radius: 70,
                    )
                  : CircleAvatar(
                      backgroundImage:
                          FileImage(File(userProvider.profilePicturePath)),
                      radius: 70,
                    ),
          Positioned(
            right: 4,
            top: 100,
            child: Transform.scale(
              scale: 1.5,
              child: Card(
                color: DSColors.tertiary,
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: InkWell(
                  onTap: () {
                    userProvider.showImagePicker(context);
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(3.0),
                    child: DSIconSmallSecondary(
                      iconName: 'camera',
                    ),
                  ),
                ),
              ),
            ),
          )
        ]),
      )),
    );
  }
}
