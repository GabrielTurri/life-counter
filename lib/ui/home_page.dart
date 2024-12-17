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
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    int numJogadores = context.watch<MultiPlayerLifeController>().numJogadores;
    final multiplayerController = context.read<MultiPlayerAppController>();

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
              multiplayerController.changeRotationUpsideDown(
                numJogadores: numJogadores,
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
      body: LayoutBuilder(builder: (context, orientation) {
        if (isPortrait == true) {
          return Column(
            children: List.generate(numJogadores, (index) {
              return PlayerBlock(index: index);
            }),
          );
        } else {
          return Row(
            children: List.generate(numJogadores, (index) {
              return PlayerBlock(index: index);
            }),
          );
        }
      }),
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

class PlayerBlock extends StatelessWidget {
  int index;

  PlayerBlock({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final playerApp = context.watch<MultiPlayerAppController>();

    return Expanded(
      child: RotatedBox(
        quarterTurns: playerApp.players[index].rotacao,
        child: PlayerLifeContainer(
          playerIndex: index,
          initialLife: 20,
        ),
      ),
    );
  }
}
