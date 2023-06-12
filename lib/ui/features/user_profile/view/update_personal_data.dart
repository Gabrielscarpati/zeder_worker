import 'package:flutter/material.dart';
import 'package:zeder/design_system/design_system.dart';
import '../../../device_type.dart';
import '../../../widgets/botoes.dart';
import '../../../widgets/client/client_viewmodel.dart';
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
        child: AppBarProfile(title: 'Update your personal data',
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
                title: 'Name',
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
                title: 'Phone',
                iconName: 'phone',
                content: widget.user.phone,
                onPressed: () {
                  //navigateSecondPage(EditName());
                },
              ),
              profile_data_widget(
                title: 'Social Security Number',
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
                  texto: 'Done',
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
      onTap: onPressed,
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


/*
class StandardFormFieldEmail extends StatefulWidget {
  final TextEditingController? controller;
  final String hint;
  final String iconName;
   StandardFormFieldEmail({Key? key, required this.controller, required this.hint, required this.iconName}) : super(key: key);

  @override
  State<StandardFormFieldEmail> createState() => _StandardFormFieldEmailState();
}

class _StandardFormFieldEmailState extends State<StandardFormFieldEmail> {
  @override
  Widget build(BuildContext context) {
    final ClientProvider _Provider = context.watch<ClientProvider>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: SizedBox(
        height: 56,
        child: TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
          onChanged: (value) {
            setState(() {
              //_Provider.applicarFiltroNalista(value);
            });
          },
          textAlignVertical: TextAlignVertical.center,
          style: const TextStyle(
            fontSize: 16,
            color: DSColors.tertiary,
          ),
          controller: widget.controller,
          cursorColor: Colors.indigoAccent,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.white,
            hintText: widget.hint,
            hintStyle: const TextStyle(
              fontSize: 16,
              color: DSColors.tertiary,
            ),

            prefixIcon: DSIconPrimary(iconName: widget.iconName,),
          ),
          keyboardType: TextInputType.emailAddress,
        ),
      ),
    );
  }
}

*/
