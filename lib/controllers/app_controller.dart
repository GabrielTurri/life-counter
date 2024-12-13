import 'package:flutter/material.dart';

class AppController extends ChangeNotifier {
  bool isRotated = false;
  int rotacao = 0;

  late Color? lifeColor;
  late Color? bgColor;
  late Color activeColor;

  changeRotationUpsideDown(numJogadores, playerIndex) async {
    if (playerIndex == 0 && numJogadores == 2) {
      isRotated = !isRotated;
      isRotated ? rotacao = 2 : rotacao = 0;
      notifyListeners();
    }
  }

  changeColor(color) {
    lifeColor = ColorScheme.appColors[color]?[0];
    bgColor = ColorScheme.appColors[color]?[1];
    activeColor = color;
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
          player.changeColor(Colors.green);
          break;
        case 1:
          player.changeColor(Colors.purple);
          break;
        case 3:
          player.changeColor(Colors.orange);
          break;
        case 4:
          player.changeColor(Colors.red);
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

  changeColor(playerIndex, color) {
    if (playerIndex < players.length) {
      players[playerIndex].changeColor(color);
    }
    notifyListeners();
  }
}

class ColorScheme {
  static Map<Color, List<Color?>> appColors = {
    Colors.green: [Colors.green[300], Colors.green[400]],
    Colors.greenAccent: [Colors.greenAccent[200], Colors.greenAccent[400]],
    Colors.cyan: [Colors.cyan[200], Colors.cyan[400]],
    Colors.purple: [Colors.purple[300], Colors.purple[400]],
    Colors.red: [Colors.red[300], Colors.red[600]],
    Colors.pink: [Colors.pink[300], Colors.pink[600]],
    Colors.orange: [Colors.orange[200], Colors.orange[400]],
    Colors.blueGrey: [Colors.blueGrey[700], Colors.blueGrey[800]],
  };
}
