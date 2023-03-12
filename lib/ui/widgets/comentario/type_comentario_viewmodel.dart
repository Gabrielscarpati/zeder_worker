import 'package:flutter/cupertino.dart';

class TypeCommentViewmodel {
  final String? hintText;
  final TextEditingController textEditingController;
  int rating;
  TypeCommentViewmodel({
    required this.hintText,
    required this.textEditingController,
    required this.rating,
  });
}