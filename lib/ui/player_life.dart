import 'package:flutter/material.dart';
import 'package:life_counter/controllers/life_controller.dart';
import 'package:provider/provider.dart';
import 'life_counter/widgets/life_button.dart';

class PlayerLife extends StatelessWidget {
  final Color? lifeColor;
  final Color? bgColor;
  final int playerIndex;

  PlayerLife({
    super.key,
    required this.lifeColor,
    required this.bgColor,
    required this.playerIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LifeButton(
                texto: '-1',
                vida: -1,
                playerIndex: playerIndex,
                color: bgColor),
            LifeButton(
                texto: '-2',
                vida: -2,
                playerIndex: playerIndex,
                color: bgColor),
            LifeButton(
                texto: '-3',
                vida: -3,
                playerIndex: playerIndex,
                color: bgColor),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context
                  .watch<MultiPlayerLifeController>()
                  .players[playerIndex]
                  .textCalculoVida,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                  color: lifeColor, borderRadius: BorderRadius.circular(8)),
              child: Center(
                child: Text(
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 24),
                  context
                      .watch<MultiPlayerLifeController>()
                      .players[playerIndex]
                      .vida
                      .toString(),
                ),
              ),
            ),
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LifeButton(
                texto: '+1', vida: 1, playerIndex: playerIndex, color: bgColor),
            LifeButton(
                texto: '+2', vida: 2, playerIndex: playerIndex, color: bgColor),
            LifeButton(
                texto: '+3', vida: 3, playerIndex: playerIndex, color: bgColor),
          ],
        ),
      ],
    );
  }
}
