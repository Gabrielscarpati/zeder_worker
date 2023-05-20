import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class HomeScreenProvider with ChangeNotifier {

  static final HomeScreenProvider provider = HomeScreenProvider._internal();

  factory HomeScreenProvider() {
    return provider;
  }
  HomeScreenProvider._internal();



}


