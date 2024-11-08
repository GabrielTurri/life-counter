import 'package:flutter/material.dart';

class PlayerLifeHistory extends StatefulWidget {
  final Color? lifeColor;
  final Color? bgColor;
  List histVida;

  PlayerLifeHistory({
    super.key,
    required this.lifeColor,
    required this.bgColor,
    required this.histVida,
  });

  @override
  PlayerLifeHistoryState createState() => PlayerLifeHistoryState();
}

class PlayerLifeHistoryState extends State<PlayerLifeHistory> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Container(
        height: 400,
        width: 80,
        decoration: BoxDecoration(
            color: widget.lifeColor, borderRadius: BorderRadius.circular(8)),
        child: ListView.builder(
            reverse: true,
            itemCount: widget.histVida.length,
            itemBuilder: (context, index) {
              return ListTile(
                minTileHeight: 4,
                title: Text(
                  textAlign: TextAlign.end,
                  widget.histVida[index],
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500),
                ),
              );
            }),
      ),
    );
  }
}
