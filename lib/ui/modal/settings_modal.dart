import 'package:flutter/material.dart';
import 'package:life_counter/controllers/app_controller.dart';
import 'package:life_counter/controllers/life_controller.dart';
import 'package:provider/provider.dart';

class SettingsModal {
  Function openModal;
  SettingsModal({required this.openModal});

  static void dialogBuilder(BuildContext context) {
    final vidaInicialController = TextEditingController(text: '20');
    final appController = context.read<AppController>();

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
                        icon: const Icon(Icons.health_and_safety),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)),
                        labelText: 'Vida inicial',
                      ),
                    ),
                  ),
                  ButtonCountRadioButton()
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const Text(
                  'Voltar',
                  style: TextStyle(color: Colors.red),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
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

                  // appController
                  //     .changeButtonCount(ButtonCountRadioButton.selectedOption);
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

class ButtonCountRadioButton extends StatelessWidget {
  const ButtonCountRadioButton({super.key});

  @override
  Widget build(BuildContext context) {
    final appController = context.read<AppController>();
    final appControllerData = context.watch<AppController>();
    var selectedOption = appControllerData.buttonCount;

    return Column(
      children: <Widget>[
        const Text(
          'Alterar quantidade de botões',
          style: TextStyle(fontSize: 16),
        ),
        RadioListTile(
          title: const Text('1'),
          value: 1,
          groupValue: appControllerData.buttonCount,
          onChanged: (value) {
            appController.changeButtonCount(value);
          },
        ),
        RadioListTile(
          title: const Text('2'),
          value: 2,
          groupValue: appControllerData.buttonCount,
          onChanged: (value) {
            appController.changeButtonCount(value!);
          },
        ),
        RadioListTile(
          title: const Text('3'),
          value: 3,
          groupValue: appControllerData.buttonCount,
          onChanged: (value) {
            appController.changeButtonCount(value!);
          },
        ),
      ],
    );
  }
}
