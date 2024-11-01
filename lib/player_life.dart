import 'package:flutter/material.dart';
import './life_button.dart';

class PlayerLife extends StatefulWidget {
  final Color? lifeColor;
  final Color? bgColor;
  final int vidaInicial;
  int vida;

  PlayerLife({
    Key? key,
    required this.lifeColor,
    required this.bgColor,
    required this.vidaInicial,
  })  : vida = vidaInicial,
        super(key: key);

  @override
  PlayerLifeState createState() => PlayerLifeState();
}

class PlayerLifeState extends State<PlayerLife> {
  resetarVida() {
    setState(() {
      widget.vida = widget.vidaInicial;
    });
  }

  alterarVida(int valor) {
    setState(() {
      widget.vida += valor;
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
                    LifeButton(
                        texto: '-1',
                        onPressed: () {
                          alterarVida(-1);
                        },
                        color: widget.bgColor),
                    LifeButton(
                        texto: '-2',
                        onPressed: () {
                          alterarVida(-2);
                        },
                        color: widget.bgColor),
                    LifeButton(
                        texto: '-3',
                        onPressed: () {
                          alterarVida(-3);
                        },
                        color: widget.bgColor),
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
                    widget.vida.toString(),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LifeButton(
                        texto: '+1',
                        onPressed: () {
                          alterarVida(1);
                        },
                        color: widget.bgColor),
                    LifeButton(
                        texto: '+2',
                        onPressed: () {
                          alterarVida(2);
                        },
                        color: widget.bgColor),
                    LifeButton(
                        texto: '+3',
                        onPressed: () {
                          alterarVida(3);
                        },
                        color: widget.bgColor),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
