import 'package:flutter/material.dart';
import 'package:life_counter/controllers/app_controller.dart';
import 'package:life_counter/controllers/life_controller.dart';
import 'package:life_counter/ui/player_life/player_life_container.dart';
import 'package:life_counter/ui/modal/reset_modal.dart';
import 'package:life_counter/ui/modal/settings_modal.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final playerApp = context.watch<MultiPlayerAppController>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        title: const Text(
          'Life Counter',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              final multiplayerController =
                  context.read<MultiPlayerAppController>();

              multiplayerController.changeRotationUpsideDown(
                numJogadores: Provider.of<MultiPlayerLifeController>(
                  context,
                  listen: false,
                ).numJogadores,
                playerIndex: 0,
              );
            },
            icon: const Icon(Icons.swap_vert),
            style:
                ButtonStyle(iconColor: WidgetStateProperty.all(Colors.white)),
          ),
          IconButton(
            onPressed: () {
              SettingsModal.dialogBuilder(context);
            },
            icon: const Icon(Icons.settings),
            style:
                ButtonStyle(iconColor: WidgetStateProperty.all(Colors.white)),
          )
        ],
      ),
      body: Column(
        children: List.generate(
            context.watch<MultiPlayerLifeController>().numJogadores, (index) {
          return Expanded(
            child: RotatedBox(
              quarterTurns: playerApp.players[index].rotacao,
              child: PlayerLifeContainer(
                playerIndex: index,
                initialLife: 20,
              ),
            ),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ResetModal.dialogBuilder(context);
        },
        tooltip: 'Reset',
        child: const Icon(Icons.restart_alt_outlined),
      ),
    );
  }
}
