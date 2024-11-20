import 'package:flutter/material.dart';
import 'package:life_counter/controllers/life_controller.dart';
import 'package:provider/provider.dart';

class LifeButton extends StatelessWidget {
  final String texto;
  final Color? color;
  final int playerIndex;
  final int vida;

  const LifeButton(
      {super.key,
      required this.texto,
      required this.playerIndex,
      required this.color,
      required this.vida});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: ElevatedButton(
          onPressed: () {
            context
                .read<MultiPlayerLifeController>()
                .alterarVida(playerIndex, vida);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
          ),
          child: Text(
            texto,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w800,
              color: color,
            ),
          )),
    );
  }
}
