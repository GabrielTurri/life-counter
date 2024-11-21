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
  Map<String, List<Color?>> appColors = {
    'green': [Colors.green[300], Colors.green[400]],
    'purple': [Colors.purple[300], Colors.purple[400]],
    'cyan': [Colors.cyan[300], Colors.cyan[400]],
  };
  List<AppController> players = [];

  MultiPlayerAppController(int numJogadores) {
    for (int i = 0; i < numJogadores; i++) {
      final player = AppController();
      switch (i) {
        case 0:
          player.lifeColor = appColors['green']?[0];
          player.bgColor = appColors['green']?[1];
          break;
        case 1:
          player.lifeColor = appColors['purple']?[0];
          player.bgColor = appColors['purple']?[1];
          break;
      }
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
