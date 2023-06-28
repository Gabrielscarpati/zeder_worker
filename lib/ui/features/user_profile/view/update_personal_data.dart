import 'package:flutter/material.dart';
import 'package:zeder/design_system/design_system.dart';
import '../../../device_type.dart';
import '../../../widgets/botoes.dart';
import '../../../widgets/client/client_viewmodel.dart';
import '../../SignUp/views/widgets/snackbars.dart';
import 'app_bar_profile.dart';

class UpdatePersonalData extends StatefulWidget {
  final WorkerViewModel user;
  const UpdatePersonalData({Key? key, required this.user}) : super(key: key);

  @override
  _UpdatePersonalDataState createState() => _UpdatePersonalDataState();
}
class _UpdatePersonalDataState extends State<UpdatePersonalData> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double padding;
    DeviceType deviceType = getDeviceType(MediaQuery.of(context).size.width);
    deviceType == DeviceType.Desktop? padding = (screenWidth-900)/2 : padding = 8;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: AppBarProfile(title: 'Atualize seus dados',
            onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(right: padding, left: padding),
        child: SingleChildScrollView(
          child: Column(
            children: [
              profile_data_widget(
                title: 'Nome',
                iconName: 'account',
                content: widget.user.nome,
                onPressed: () {
                  //navigateSecondPage(EditName());
                },
              ),
              profile_data_widget(
                title: 'Email',
                iconName: 'Email',
                content: widget.user.email,
                onPressed: () {
                  //navigateSecondPage(EditName());
                },
              ),
              profile_data_widget(
                title: 'Telefone',
                iconName: 'phone',
                content: widget.user.phone,
                onPressed: () {
                  //navigateSecondPage(EditName());
                },
              ),
              profile_data_widget(
                title: 'CPF',
                iconName: 'id-card',
                content: widget.user.cpfCnpj,
                onPressed: () {
                  //navigateSecondPage(EditName());
                },
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
      ),
    );
  }

  Widget profile_data_widget({
    required String title,
    required String iconName,
    required String content,
    required void Function() onPressed,
    }){
    return InkWell(
      onTap: () {
        ShowSnackBar(context: context).showErrorSnackBar(message: 'Você ainda não pode atualizar essas informaçōes por questāo de seguraça',);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DSTextSubtitleBoldSecondary(text: title),
          const SizedBox(height: 8),
          Container(
            height: 56,
            decoration: BoxDecoration(
              color: Colors.white, // Set the background color to white
              borderRadius: BorderRadius.circular(10.0), // Set the border radius
            ),
            child: Row(
                children:[
                  const SizedBox(width: 8),
                  DSIconTertiary(iconName: iconName,),
                  const SizedBox(width: 8),
                  DSTextTitleTertiary(text: content),
                ]
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
  void navigateSecondPage(Widget editForm) {
    Route route = MaterialPageRoute(builder: (context) => editForm);
    Navigator.push(context, route);
  }
}
