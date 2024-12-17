import 'package:flutter/material.dart';
import 'package:life_counter/controllers/app_controller.dart';
import 'package:life_counter/controllers/life_controller.dart';
import 'package:provider/provider.dart';
import 'life_button.dart';

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
    final playerLife =
        context.watch<MultiPlayerLifeController>().players[playerIndex];

    final buttonCount = context.watch<AppController>().buttonCount;

    return Row(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            buttonCount,
            (index) {
              int x = index + 1;
              int value = x - (x * 2);

              return LifeButton(
                texto: value.toString(),
                vida: value,
                playerIndex: playerIndex,
                color: bgColor,
              );
            },
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              playerLife.textCalculoVida,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(8, 0, 8, 28),
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
                  playerLife.vida.toString(),
                ),
              ),
            ),
          ],
        ),
        Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              buttonCount,
              (index) {
                int value = index + 1;

                return LifeButton(
                  texto: '+$value',
                  vida: value,
                  playerIndex: playerIndex,
                  color: bgColor,
                );
              },
            )),
      ],
    );
  }
}
