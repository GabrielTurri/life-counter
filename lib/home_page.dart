import 'package:flutter/material.dart';
import 'package:life_counter/app_controller.dart';
import 'package:life_counter/player_life/player_life_container.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<PlayerLifeContainerState> player1Key =
      GlobalKey<PlayerLifeContainerState>();
  final GlobalKey<PlayerLifeContainerState> player2Key =
      GlobalKey<PlayerLifeContainerState>();

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
            onPressed: AppController.instance.changeRotation,
            icon: const Icon(Icons.swap_vert),
            style:
                ButtonStyle(iconColor: WidgetStateProperty.all(Colors.white)),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: AnimatedBuilder(
                animation: AppController.instance,
                builder: (context, child) {
                  return RotatedBox(
                    quarterTurns: AppController.instance.rotacao,
                    child: PlayerLifeContainer(
                      key: player1Key,
                      lifeColor: Colors.green[300],
                      bgColor: Colors.green[400],
                      vidaInicial: 20,
                    ),
                  );
                }),
          ),
          Expanded(
            child: PlayerLifeContainer(
              key: player2Key,
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
                player1Key.currentState?.resetarVida();
                player2Key.currentState?.resetarVida();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
