import 'package:flutter/material.dart';
import 'package:life_counter/controllers/life_controller.dart';
import 'package:provider/provider.dart';

class PlayerLifeHistory extends StatelessWidget {
  final Color? lifeColor;
  final Color? bgColor;
  final int playerIndex;

  const PlayerLifeHistory({
    super.key,
    required this.lifeColor,
    required this.bgColor,
    required this.playerIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Container(
        height: 400,
        width: 80,
        decoration: BoxDecoration(
            color: lifeColor, borderRadius: BorderRadius.circular(8)),
        child: ListView.builder(
            reverse: true,
            itemCount: context
                .watch<MultiPlayerLifeController>()
                .players[playerIndex]
                .histVida
                .length,
            itemBuilder: (context, index) {
              return ListTile(
                minTileHeight: 4,
                title: Text(
                  textAlign: TextAlign.end,
                  context
                      .watch<MultiPlayerLifeController>()
                      .players[playerIndex]
                      .histVida[index],
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500),
                ),
              );
            }),
      ),
    );
  }
}
