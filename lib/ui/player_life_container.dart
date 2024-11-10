import 'dart:async';

import 'package:flutter/material.dart';
import 'package:life_counter/ui/life_history.dart';
import 'player_life.dart';

class PlayerLifeContainer extends StatefulWidget {
  final Color? lifeColor;
  final Color? bgColor;
  final int vidaInicial;

  PlayerLifeContainer({
    super.key,
    required this.lifeColor,
    required this.bgColor,
    required this.vidaInicial,
  });

  @override
  PlayerLifeContainerState createState() => PlayerLifeContainerState();
}

class PlayerLifeContainerState extends State<PlayerLifeContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: widget.bgColor),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            PlayerLifeHistory(
              bgColor: widget.bgColor,
              lifeColor: widget.lifeColor,
            ),
            PlayerLife(
              lifeColor: widget.lifeColor,
              bgColor: widget.bgColor,
            )
          ],
        ),
      ),
    );
  }
}
