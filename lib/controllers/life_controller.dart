import 'dart:async';
import 'package:flutter/material.dart';

class PlayerLifeController extends ChangeNotifier {
  int vidaInicial = 20;
  int vida = 20;
  List histVida = [];
  int calculoVida = 0;
  String textCalculoVida = '';

  resetarVida() {
    vida = vidaInicial;
    histVida.clear();
    textCalculoVida = '';
    notifyListeners();
  }

  final _timer = TimerVida(milliseconds: 1000);

  alterarVida(int valor) {
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

  void atualizarVidaInicial(novaVidaInicial) {
    if (novaVidaInicial > 0) {
      vidaInicial = novaVidaInicial;
    }
    notifyListeners();
  }
}

class MultiPlayerLifeController extends ChangeNotifier {
  int numJogadores = 2;
  List<PlayerLifeController> players = [];

  MultiPlayerLifeController(int numJogadores) {
    for (int i = 0; i < numJogadores; i++) {
      final player = PlayerLifeController();
      player.addListener(notifyListeners);
      players.add(player);
    }
  }

  alterarVida(int playerIndex, int valor) {
    if (playerIndex < players.length) {
      players[playerIndex].alterarVida(valor);
    }
    notifyListeners();
  }

  void resetarVida() {
    for (var i = 0; i < players.length; i++) {
      players[i].resetarVida();
    }
    notifyListeners();
  }

  void atualizarVidaInicial(int novaVidaInicial) {
    for (var i = 0; i < players.length; i++) {
      players[i].atualizarVidaInicial(novaVidaInicial);
    }
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
