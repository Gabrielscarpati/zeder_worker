import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:ui/widgets/image_form_field.dart';
import 'package:zeder/design_system/design_system.dart';
import '../../../../application/provider/logInSignUpProvider.dart';

class GetSaveImage extends StatefulWidget {
  const GetSaveImage({Key? key}) : super(key: key);

  @override
  State<GetSaveImage> createState() => _GetSaveImageState();
}

class _GetSaveImageState extends State<GetSaveImage> {
  @override
  Widget build(BuildContext context) {
    final provider = context.read<LogInSignUpProvider>();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
              color: DSColors.secondary,
              width: 1.0, // Set the border width
            ),
          ),
        child: ImageFormField(
          image: provider.image,
          onSelectImage: () async {
            await provider.selectImage();
            setState(()  {
              });
          },
          validator: (value) {

            if (value == null) {
              return 'favor adicionar uma foto';
            }
            return null;
          },

        ),
      ),
    );
  }
}
