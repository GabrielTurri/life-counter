import 'package:flutter/material.dart';
import 'package:life_counter/controllers/app_controller.dart';
import 'package:life_counter/controllers/life_controller.dart';
import 'package:life_counter/ui/player_life_container.dart';
import 'package:life_counter/ui/reset_modal.dart';
import 'package:life_counter/ui/settings_modal.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  final MultiPlayerLifeController playerController =
      MultiPlayerLifeController(2);
  MyHomePage({super.key});

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
        children: [
          Expanded(
            child: RotatedBox(
              quarterTurns: context.watch<AppController>().rotacao,
              child: PlayerLifeContainer(
                playerIndex: 0,
                playerController: playerController,
                lifeColor: Colors.green[300],
                bgColor: Colors.green[400],
                vidaInicial: 20,
              ),
            ),
          ),
          Expanded(
            child: PlayerLifeContainer(
              playerIndex: 1,
              playerController: playerController,
              lifeColor: Colors.purple[300],
              bgColor: Colors.purple[400],
              vidaInicial: 20,
            ),
          ),
        ],
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
