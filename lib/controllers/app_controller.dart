import 'package:flutter/material.dart';

class AppController extends ChangeNotifier {
  // static AppController instance = AppController();

  bool isRotated = false;
  int rotacao = 0;

  changeRotation() async {
    isRotated = !isRotated;
    isRotated ? rotacao = 2 : rotacao = 0;
    notifyListeners();
  }
}
