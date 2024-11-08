import 'package:flutter/material.dart';

class PlayerLifeController extends ChangeNotifier {
  static PlayerLifeController instance = PlayerLifeController();

  final int vidaInicial = 20;
  int vida = 20;
  var histVida = [];
  int calculoVida = 0;
  String textCalculoVida = '';

  resetarVida(vida) {
    vida = vidaInicial;
    histVida.clear();
    textCalculoVida = '';
    notifyListeners();
  }
}
