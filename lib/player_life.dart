import 'package:flutter/material.dart';
import './life_button.dart';

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

  alterarVida(int valor){
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
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LifeButton(texto: '-1', onPressed: () { alterarVida(-1); }),
                      LifeButton(texto: '-2', onPressed: () { alterarVida(-2); }),
                      LifeButton(texto: '-3', onPressed: () { alterarVida(-3); }),
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
                      LifeButton(texto: '+1', onPressed: () { alterarVida(1); }),
                      LifeButton(texto: '+2', onPressed: () { alterarVida(2); }),
                      LifeButton(texto: '+3', onPressed: () { alterarVida(3); }),
                    ],
                  ),
              ],
            ),
          ),
        ));
  }
}