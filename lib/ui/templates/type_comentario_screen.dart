import 'package:flutter/material.dart';
import 'package:zeder/ui/widgets/comentario/type_comentario_viewmodel.dart';
import '../widgets/comentario/type_comentario.dart';

class TypeComentarioScreen extends StatefulWidget {
  const TypeComentarioScreen({Key? key}) : super(key: key);

  @override
  State<TypeComentarioScreen> createState() => _TypeComentarioScreenState();
}

class _TypeComentarioScreenState extends State<TypeComentarioScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Type Comentario Screen"),
      ),
      bottomSheet: TypeComentario(
        viewModel:  TypeCommentViewmodel(
            hintText: 'Escreva seu comentário',
            textEditingController: TextEditingController(),
            rating: 5
        ),
      ),
    );
  }
}
