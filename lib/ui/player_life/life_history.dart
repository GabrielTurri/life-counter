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
    final histVida = context
        .watch<MultiPlayerLifeController>()
        .players[playerIndex]
        .histVida;

    // return Padding(
    //   padding: const EdgeInsets.symmetric(vertical: 16),
    //   child: Container(
    //     height: 400,
    //     width: 80,
    //     decoration: BoxDecoration(
    //         color: lifeColor, borderRadius: BorderRadius.circular(8)),
    //     child: ListView.builder(
    //       itemCount: histVida.length,
    //       itemBuilder: (context, index) {
    //         return ListTile(
    //           tileColor: Colors.red[900], // Cor de fundo aplicada no ListTile
    //           minTileHeight: 4,
    //           title: Text(
    //             textAlign: TextAlign.end,
    //             histVida[index],
    //             style: const TextStyle(
    //                 color: Colors.white, fontWeight: FontWeight.w500),
    //           ),
    //         );
    //       },
    //     ),
    //   ),
    // );
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
            var listTileColor;

            if (int.parse(histVida[index]) < 0) {
              listTileColor = Colors.red[900];
            } else {
              // listTileColor = const Color.fromARGB(0, 183, 28, 28);
              listTileColor = Colors.green[800];
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
