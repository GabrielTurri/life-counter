import 'package:flutter/material.dart';

class AppController extends ChangeNotifier {
  bool isRotated = false;
  int rotacao = 0;

  Color? lifeColor = Colors.green[300];
  Color? bgColor = Colors.green[400];
  int colorScheme = 1;

  changeRotationUpsideDown(numJogadores, playerIndex) async {
    if (playerIndex == 0 && numJogadores == 2) {
      isRotated = !isRotated;
      isRotated ? rotacao = 2 : rotacao = 0;
      notifyListeners();
    }
  }

  changeColor() {
    ColorScheme.appColors[colorScheme]?[0];
    ColorScheme.appColors[colorScheme]?[1];
    notifyListeners();
  }
}

class MultiPlayerAppController extends ChangeNotifier {
  List<AppController> players = [];

  MultiPlayerAppController(int numJogadores) {
    for (int i = 0; i < numJogadores; i++) {
      final player = AppController();
      switch (i) {
        case 0:
          player.lifeColor = ColorScheme.appColors[1]?[0];
          player.bgColor = ColorScheme.appColors[1]?[1];
          player.colorScheme = 1;
          break;
        case 1:
          player.lifeColor = ColorScheme.appColors[2]?[0];
          player.bgColor = ColorScheme.appColors[2]?[1];
          player.colorScheme = 2;
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

  changeColor(playerIndex) {
    if (playerIndex < players.length) {
      players[playerIndex].changeColor();
    }
    notifyListeners();
  }
}

class ColorScheme {
  static Map<int, List<Color?>> appColors = {
    1: [Colors.green[300], Colors.green[400]],
    2: [Colors.purple[300], Colors.purple[400]],
    3: [Colors.cyan[300], Colors.cyan[400]],
    4: [Colors.red[300], Colors.red[400]],
    5: [Colors.orange[300], Colors.orange[400]],
  };
}
