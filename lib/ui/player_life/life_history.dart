import 'package:flutter/material.dart';
import 'package:life_counter/controllers/app_controller.dart';
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
    final histVida = context
        .watch<MultiPlayerLifeController>()
        .players[playerIndex]
        .histVida;
    final isColoredTilesActive =
        context.watch<AppController>().isColoredTilesActive;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Container(
        height: 400,
        width: 80,
        decoration: BoxDecoration(
            color: lifeColor, borderRadius: BorderRadius.circular(8)),
        child: ListView.builder(
          itemCount: histVida.length,
          itemBuilder: (context, index) {
            Color? listTileColor;

            if (isColoredTilesActive == true) {
              listTileColor = (int.parse(histVida[index]) < 0)
                  ? Colors.red[900]
                  : Colors.green[800];
            }
            return Container(
              margin: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: listTileColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListTile(
                minTileHeight: 4,
                title: Text(
                  textAlign: TextAlign.end,
                  histVida[index],
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
