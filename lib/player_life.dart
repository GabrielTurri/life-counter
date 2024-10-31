import 'package:flutter/material.dart';

class PlayerLife extends StatefulWidget {
  final Color? lifeColor;
  final Color? bgColor;
  

  PlayerLife({super.key,  required this.lifeColor , required this.bgColor});

  
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

  _reduzirVida(int valor) {
    setState(() {
      vida -= valor;
    });
  }

  _aumentarVida(int valor) {
    setState(() {
      vida += valor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: widget.bgColor),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 64),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // const Column(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   children: [
                //   Text('teste'),
                //   Text('teste'),
                //   Text('teste'),
                // ],),                
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          _reduzirVida(1);
                        },
                        child: const Text('-1'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _reduzirVida(2);
                        },
                        child: const Text('-2'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _reduzirVida(3);
                        },
                        child: const Text('-3'),
                      ),
                    ],
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
                Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          _aumentarVida(1);
                        },
                        child: const Text('+1'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _aumentarVida(2);
                        },
                        child: const Text('+2'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _aumentarVida(3);
                        },
                        child: const Text('+3'),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ));
  }
}
