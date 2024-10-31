import 'package:flutter/material.dart';

class PlayerLife extends StatefulWidget {
  final Color? lifeColor;
  final Color? bgColor;
  const PlayerLife({super.key,  required this.lifeColor , required this.bgColor});

  
  @override
  State<PlayerLife> createState() => _PlayerLifeState();
  
}

class _PlayerLifeState extends State<PlayerLife> {
  int vida = 20;


  resetarVida() {
    setState(() {
      vida = 20;
    });
  }

  _reduzirVida(player) {
    setState(() {
      vida--;
    });
  }

  _aumentarVida(player) {
    setState(() {
      vida++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: widget.bgColor),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _reduzirVida(1);
                  },
                  child: const Text('-1'),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                  decoration: BoxDecoration(
                      color: widget.lifeColor,
                      borderRadius: BorderRadius.circular(8)),
                  child: Text(
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 24),
                    '$vida',
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      _aumentarVida(1);
                    },
                    child: const Text('+1')),
              ],
            ),
          ),
        ));
  }
}
