import 'package:flutter/material.dart';
import 'package:life_counter/controllers/app_controller.dart';
import 'package:life_counter/controllers/life_controller.dart';
import 'package:life_counter/ui/life_counter/widgets/player_life_container.dart';
import 'package:life_counter/ui/modal/reset_modal.dart';
import 'package:life_counter/ui/modal/settings_modal.dart';
import 'package:provider/provider.dart';

class LifeCounterPage extends StatelessWidget {
  final MultiPlayerLifeController playerController =
      MultiPlayerLifeController(2);
  LifeCounterPage({super.key});

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
                lifeColor: Colors.green[300],
                bgColor: Colors.green[400],
              ),
            ),
          ),
          Expanded(
            child: PlayerLifeContainer(
              playerIndex: 1,
              lifeColor: Colors.purple[300],
              bgColor: Colors.purple[400],
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
