import 'dart:async';
import 'package:flutter/material.dart';

class PlayerLifeController extends ChangeNotifier {
  final int vidaInicial = 20;
  int vida = 20;
  var histVida = [];
  int calculoVida = 0;
  String textCalculoVida = '';

  resetarVida(vidaInicial) {
    vida = vidaInicial;
    histVida.clear();
    textCalculoVida = '';
    notifyListeners();
  }

  final _timer = TimerVida(milliseconds: 1000);

  void alterarVida(int valor) {
    vida += valor;
    calculoVida += valor;
    textCalculoVida =
        (calculoVida > 0) ? '+$calculoVida' : calculoVida.toString();

    notifyListeners();

    _timer.run(() {
      calcularVida();
    });
  }

  void calcularVida() {
    if (calculoVida != 0) {
      histVida.add(textCalculoVida);
    }

    calculoVida = 0;
    textCalculoVida = '';
    notifyListeners();
  }
}

class TimerVida {
  final int milliseconds;
  Timer? _timer;

  TimerVida({required this.milliseconds});

  void run(VoidCallback action) {
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
