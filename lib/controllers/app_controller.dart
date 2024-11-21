import 'package:flutter/material.dart';

class AppController extends ChangeNotifier {
  bool isRotated = false;
  int rotacao = 0;

  Color? lifeColor = Colors.green[300];
  Color? bgColor = Colors.green[400];

  changeRotationUpsideDown(numJogadores, playerIndex) async {
    if (playerIndex == 0 && numJogadores == 2) {
      isRotated = !isRotated;
      isRotated ? rotacao = 2 : rotacao = 0;
      notifyListeners();
    }
  }
}

class MultiPlayerAppController extends ChangeNotifier {
  List<AppController> players = [];

  MultiPlayerAppController(int numJogadores) {
    for (int i = 0; i < numJogadores; i++) {
      final player = AppController();
      player.addListener(notifyListeners);
      players.add(player);
    }
  }
  changeRotationUpsideDown({numJogadores, playerIndex}) {
    if (playerIndex < players.length) {
      players[playerIndex].changeRotationUpsideDown(numJogadores, playerIndex);
    }
    notifyListeners();
  }
}
