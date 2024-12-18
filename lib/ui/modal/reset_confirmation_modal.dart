import 'package:flutter/material.dart';
import 'package:life_counter/controllers/life_controller.dart';
import 'package:provider/provider.dart';

class ResetConfirmationModal {
  static void dialogBuilder(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Provider(
          create: (context) => PlayerLifeController(),
          child: AlertDialog(
            title: const Text('Atenção!'),
            content: const Text(
              'Deseja reiniciar os contadores de vida de ambos jogadores?\n'
              '\n'
              'Essa ação não poderá ser revertida.',
            ),
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const Text('Salvar sem reiniciar'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: Text(
                  'Reiniciar contadores!',
                  style: TextStyle(color: Colors.red[600]),
                ),
                onPressed: () {
                  context.read<MultiPlayerLifeController>().resetarVida();
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
