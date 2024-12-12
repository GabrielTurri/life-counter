import 'package:flutter/material.dart';
import 'package:life_counter/controllers/life_controller.dart';
import 'package:provider/provider.dart';

class ColorPickerModal {
  Color color = Colors.green;

  Widget buildColorPicker() => ColorPicker(
        pickerColor: playerApp.bgColor,
        onColorChanged: (color) => this.color = color,
      );

  void dialogBuilder(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Selecionar cor do Jogador'),
        content: Column(
          children: [
            buildColorPicker(),
            TextButton(
              child: const Text('Selecionar'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
    );
  }
}
