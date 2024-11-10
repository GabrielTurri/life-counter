import 'package:flutter/material.dart';
import 'package:life_counter/controllers/life_controller.dart';
import 'package:provider/provider.dart';
import 'life_button.dart';

class PlayerLife extends StatelessWidget {
  final Color? lifeColor;
  final Color? bgColor;

  PlayerLife({
    super.key,
    required this.lifeColor,
    required this.bgColor,
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
                onPressed: () {
                  // widget.alterarVida(-1);
                  context.read<PlayerLifeController>().alterarVida(-1);
                },
                color: bgColor),
            LifeButton(
                texto: '-2',
                onPressed: () {
                  context.read<PlayerLifeController>().alterarVida(-2);
                },
                color: bgColor),
            LifeButton(
                texto: '-3',
                onPressed: () {
                  context.read<PlayerLifeController>().alterarVida(-3);
                },
                color: bgColor),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.watch<PlayerLifeController>().textCalculoVida,
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
                  // widget.vida.toString(),
                  context.watch<PlayerLifeController>().vida.toString(),
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
                texto: '+1',
                onPressed: () {
                  context.read<PlayerLifeController>().alterarVida(1);
                },
                color: bgColor),
            LifeButton(
                texto: '+2',
                onPressed: () {
                  context.read<PlayerLifeController>().alterarVida(2);
                },
                color: bgColor),
            LifeButton(
                texto: '+3',
                onPressed: () {
                  context.read<PlayerLifeController>().alterarVida(3);
                },
                color: bgColor),
          ],
        ),
      ],
    );
  }
}
