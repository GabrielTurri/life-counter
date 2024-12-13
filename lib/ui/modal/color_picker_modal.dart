import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:life_counter/controllers/app_controller.dart';
import 'package:provider/provider.dart';

class ColorPickerModal {
  static void dialogBuilder(BuildContext context, playerIndex) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Selecionar cor do Jogador'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildColorPicker(playerIndex),
            TextButton(
              child: const Text('Fechar'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
    );
  }
}

class buildColorPicker extends StatelessWidget {
  int playerIndex;

  buildColorPicker(this.playerIndex);

  @override
  Widget build(BuildContext context) {
    final playerApp = context.watch<MultiPlayerAppController>();

    return BlockPicker(
      pickerColor: playerApp.players[playerIndex].activeColor,
      onColorChanged: (color) => playerApp.changeColor(playerIndex, color),
      availableColors: [
        Colors.green,
        Colors.greenAccent,
        Colors.cyan,
        Colors.purple,
        Colors.red,
        Colors.orange,
        Colors.pink,
        Colors.blueGrey
      ],
    );
  }
}
