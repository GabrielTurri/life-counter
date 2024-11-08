import 'package:flutter/material.dart';

class AppController extends ChangeNotifier {
  static AppController instance = AppController();

  final int vidaInicial = 20;
  bool isRotated = false;
  int rotacao = 0;

  changeRotation() {
    isRotated = !isRotated;
    isRotated ? rotacao = 2 : rotacao = 0;
    notifyListeners();
  }
}
