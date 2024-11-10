import 'package:flutter/material.dart';
import 'package:life_counter/controllers/app_controller.dart';
import 'package:life_counter/controllers/life_controller.dart';
import 'package:life_counter/ui/player_life_container.dart';
import 'package:provider/provider.dart';

class MyHomePage2 extends StatelessWidget {
  MyHomePage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          'Life Counter',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: context.read<AppController>().changeRotation,
            icon: const Icon(Icons.swap_vert),
            style:
                ButtonStyle(iconColor: WidgetStateProperty.all(Colors.white)),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: RotatedBox(
              quarterTurns: context.watch<AppController>().rotacao,
              child: PlayerLifeContainer(
                lifeColor: Colors.green[300],
                bgColor: Colors.green[400],
                vidaInicial: 20,
              ),
            ),
          ),
          Expanded(
            child: PlayerLifeContainer(
              lifeColor: Colors.purple[300],
              bgColor: Colors.purple[400],
              vidaInicial: 20,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _dialogBuilder(context),
        tooltip: 'Reset',
        child: const Icon(Icons.restart_alt_outlined),
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Atenção!'),
          content: const Text(
            'Deseja mesmo reiniciar os contadores de vida de ambos jogadores?\n'
            '\n'
            'Essa ação não poderá ser revertida.',
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Voltar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: Text(
                'Confirmar!',
                style: TextStyle(color: Colors.red[600]),
              ),
              onPressed: () {
                context.read<PlayerLifeController>().resetarVida(20);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
