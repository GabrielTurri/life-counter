import 'package:flutter/material.dart';
import 'package:life_counter/controllers/app_controller.dart';
import 'package:life_counter/controllers/life_controller.dart';
import 'package:life_counter/ui/player_life/life_history.dart';
import 'package:provider/provider.dart';
import 'player_life.dart';

class PlayerLifeContainer extends StatelessWidget {
  final int vidaInicial;
  final int playerIndex;
  final MultiPlayerLifeController playerController;

  PlayerLifeContainer({
    super.key,
    required this.vidaInicial,
    required this.playerIndex,
    required this.playerController,
  });

  @override
  Widget build(BuildContext context) {
    final playerApp =
        context.watch<MultiPlayerAppController>().players[playerIndex];
    return Container(
      decoration: BoxDecoration(color: playerApp.bgColor),
      child: Stack(children: [
        Positioned(
            top: 15,
            right: 15,
            child: IconButton(
                onPressed: () {
                  context
                      .read<MultiPlayerAppController>()
                      .changeColor(playerIndex);
                },
                icon: const Icon(
                  Icons.color_lens,
                  color: Colors.white,
                ))),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            PlayerLifeHistory(
              bgColor: playerApp.bgColor,
              lifeColor: playerApp.lifeColor,
              playerIndex: playerIndex,
            ),
            PlayerLife(
              lifeColor: playerApp.lifeColor,
              bgColor: playerApp.bgColor,
              playerIndex: playerIndex,
            )
          ],
        ),
      ]),
    );
  }
}