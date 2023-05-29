import 'package:flutter/material.dart';
import 'package:zeder/design_system/design_system.dart';
import 'package:zeder/ui/features/user_profile/view/update_personal_data.dart';
import '../../../widgets/botoes.dart';
import '../../../widgets/client/client_viewmodel.dart';
import 'app_bar_profile.dart';
import 'display_image.dart';

class ProfilePage extends StatefulWidget {
  final ClientsViewModel user;
  const ProfilePage({Key? key, required this.user}) : super(key: key);
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: AppBarProfile(title: 'Profile', onTap: () {
          Navigator.pop(context);
         },
        ),
      ),
      body: Column(
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
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 16.0, bottom: 8.0, top: 8.0, right: 4.0),
                    child: DSTextTitleBoldSecondary(text: 'Settings'),
                  ),
                ],
              ),
              Container(
                color: DSColors.cardColor,
                child: Column(
                  children: [
                    profile_settings(field_value: 'Update personal data', editPage:  UpdatePersonalData(user: widget.user,), iconName: 'account'),
                     Container(
                      width: double.infinity,
                      height: 2,
                       color: DSColors.tertiary,
                    ),
                    profile_settings(field_value: 'Costumer service', editPage:  UpdatePersonalData(user: widget.user,), iconName: 'help'),
                    Container(
                      width: double.infinity,
                      height: 2,
                      color: DSColors.tertiary,
                    ),
                    profile_settings(field_value: 'Rate the app', editPage:  UpdatePersonalData(user: widget.user,), iconName: 'thumb-up'),
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
                      child: const Icon(
                        Icons.power_settings_new_outlined,
                        color: DSColors.primary,
                      ),
                      onTap: () {

                      },
                    ),
                    const SizedBox(width: 8),
                    const DSTextTitleBoldPrimary(text: 'Logout'),
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
              texto: 'Done',
            ),
          ),
        ],
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