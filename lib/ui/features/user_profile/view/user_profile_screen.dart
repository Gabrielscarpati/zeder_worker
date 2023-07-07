import 'package:flutter/material.dart';
import 'package:zeder/data/firebase/firebase_controller.dart';
import 'package:zeder/design_system/design_system.dart';
import 'package:zeder/ui/features/LogIn/viewLogIn.dart';
import 'package:zeder/ui/features/user_profile/view/update_personal_data.dart';
import '../../../device_type.dart';
import '../../../widgets/botoes.dart';
import '../../../widgets/client/client_viewmodel.dart';
import 'app_bar_profile.dart';
import 'display_image.dart';

class ProfilePage extends StatefulWidget {
  final WorkerViewModel user;
  const ProfilePage({Key? key, required this.user}) : super(key: key);
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double padding;
    DeviceType deviceType = getDeviceType(MediaQuery.of(context).size.width);
    deviceType == DeviceType.Desktop? padding = (screenWidth-900)/2 : padding = 8;
    //          padding: EdgeInsets.only(right: padding, left: padding),


    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: AppBarProfile(title: 'Perfil', onTap: () {
          Navigator.pop(context);
         },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(right: padding, left: padding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                DisplayImage(
                  imagePath: widget.user.profile_picture,
                  onPressed: () {},
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DSTextTitleBoldSecondary(
                    text: widget.user.nome,
                  ),
                ),
                
                 Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 16.0, bottom: 8.0, top: 8.0, right: 4.0),
                      child: DSTextTitleBoldSecondary(text: 'Opcões'),
                    ),
                  ],
                ),
                Container(
                  color: DSColors.cardColor,
                  child: Column(
                    children: [
                      profile_settings(field_value: 'Atualizar dados', editPage:  UpdatePersonalData(user: widget.user,), iconName: 'account'),
                       Container(
                        width: double.infinity,
                        height: 2,
                         color: DSColors.tertiary,
                      ),
                      profile_settings(field_value: 'Assistência ao consumidor', editPage:  UpdatePersonalData(user: widget.user,), iconName: 'help'),
                      Container(
                        width: double.infinity,
                        height: 2,
                        color: DSColors.tertiary,
                      ),
                      profile_settings(field_value: 'Avalie o applicativo', editPage:  UpdatePersonalData(user: widget.user,), iconName: 'thumb-up'),
                      Container(
                        width: double.infinity,
                        height: 2,
                        color: DSColors.tertiary,
                      ),
                    ],
                  )
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      InkWell(
                        child:  Row(
                          children: [
                             Icon(
                              Icons.power_settings_new_outlined,
                              color: DSColors.primary,
                            ),
                             SizedBox(width: 8),
                             DSTextTitleBoldPrimary(text: 'Sair'),
                          ],
                        ),
                        onTap: () async {
                          await FirebaseManager().signOut();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const ViewLogin()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: BotaoPadraoGrande(
                onPressed: () {
                  Navigator.pop(context);
                },
                texto: 'Pronto',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget profile_settings({required String field_value, required Widget editPage, required String iconName}) =>
      TextButton(
        onPressed: () {
          navigateSecondPage(editPage);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
                children: [
                  Transform.scale(
                    scale: 1.2,
                      child: DSIconSmallTertiary(iconName: iconName)
                  ),
              const SizedBox(width: 16),
              Expanded(
                  child: DSTextTitleSecondary(
                    text: field_value,
                  )
              ),
              const DSIconLargeTertiary(iconName: 'chevron-right'),
                ]
            ),
          ],
        ),
      );

  // Handles navigation and prompts refresh.
  void navigateSecondPage(Widget editForm) {
    Route route = MaterialPageRoute(builder: (context) => editForm);
    Navigator.push(context, route);
  }
}