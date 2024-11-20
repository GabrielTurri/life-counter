import 'package:flutter/material.dart';
import 'package:life_counter/controllers/life_controller.dart';
import 'package:provider/provider.dart';

class SettingsModal {
  Function openModal;
  SettingsModal({required this.openModal});

  static void dialogBuilder(BuildContext context) {
    final vidaInicialController = TextEditingController(text: '20');
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Provider(
          create: (context) => PlayerLifeController(),
          child: AlertDialog(
            title: const Text('Configurações'),
            content: Container(
              margin: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 250,
                    child: TextFormField(
                      maxLength: 3,
                      keyboardType: TextInputType.number,
                      controller: vidaInicialController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)),
                        labelText: 'Vida inicial',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const Text(
                  'Salvar',
                  style: TextStyle(color: Colors.green),
                ),
                onPressed: () {
                  context
                      .read<MultiPlayerLifeController>()
                      .atualizarVidaInicial(
                          int.parse(vidaInicialController.text));
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
