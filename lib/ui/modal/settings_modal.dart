import 'package:flutter/material.dart';
import 'package:life_counter/controllers/app_controller.dart';
import 'package:life_counter/controllers/life_controller.dart';
import 'package:life_counter/ui/modal/reset_confirmation_modal.dart';
import 'package:provider/provider.dart';

class SettingsModal {
  Function openModal;
  SettingsModal({required this.openModal});

  static void dialogBuilder(BuildContext context) {
    final vidaInicialController = TextEditingController(text: '20');
    final multiPlayerLifeController = context.read<MultiPlayerLifeController>();

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
                  const Text(
                    'Alterar quantidade de botões',
                    style: TextStyle(fontSize: 16),
                  ),
                  const ButtonCountRadioButton(),
                  const ColoredTileCheckbox(),
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
                  multiPlayerLifeController.atualizarVidaInicial(
                      int.parse(vidaInicialController.text));

                  Navigator.of(context).pop();
                  ResetConfirmationModal.dialogBuilder(context);
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
    final List<int> radioOptions = [1, 2, 3];

    return Column(
      children: List.generate(
        radioOptions.length,
        (index) {
          return RadioListTile(
            title: Text(radioOptions[index].toString()),
            value: radioOptions[index],
            groupValue: appControllerData.buttonCount,
            onChanged: (value) {
              appController.changeButtonCount(value);
            },
          );
        },
      ),
    );
  }
}

class ColoredTileCheckbox extends StatelessWidget {
  const ColoredTileCheckbox({super.key});

  @override
  Widget build(BuildContext context) {
    final appController = context.read<AppController>();

    final appControllerData = context.watch<AppController>();

    return CheckboxListTile(
      value: appControllerData.isColoredTilesActive,
      onChanged: (bool? value) =>
          appController.changeColoredTilesCheckbox(value),
      title: const Text('Colorir valores no histórico de vida'),
    );
  }
}
