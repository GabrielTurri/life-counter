import 'package:flutter/material.dart';
import 'package:life_counter/controllers/life_controller.dart';
import 'package:life_counter/ui/life_history.dart';
import 'player_life.dart';

class PlayerLifeContainer extends StatelessWidget {
  final Color? lifeColor;
  final Color? bgColor;
  final int vidaInicial;
  final int playerIndex;
  final MultiPlayerLifeController playerController;

  PlayerLifeContainer({
    super.key,
    required this.lifeColor,
    required this.bgColor,
    required this.vidaInicial,
    required this.playerIndex,
    required this.playerController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: bgColor),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            PlayerLifeHistory(
              bgColor: bgColor,
              lifeColor: lifeColor,
              playerIndex: playerIndex,
            ),
            PlayerLife(
              lifeColor: lifeColor,
              bgColor: bgColor,
              playerIndex: playerIndex,
            )
          ],
        ),
      ),
    );
  }
}
