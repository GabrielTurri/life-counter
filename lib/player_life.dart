import 'package:flutter/material.dart';
import './life_button.dart';

class PlayerLife extends StatefulWidget {
  final Color? lifeColor;
  final Color? bgColor;
  final int vidaInicial;
  int vida;
  var histVida = [];

  PlayerLife({
    super.key,
    required this.lifeColor,
    required this.bgColor,
    required this.vidaInicial,
  }) : vida = vidaInicial;

  @override
  PlayerLifeState createState() => PlayerLifeState();
}

class PlayerLifeState extends State<PlayerLife> {
  resetarVida() {
    setState(() {
      widget.vida = widget.vidaInicial;
      widget.histVida.clear();
    });
  }

  alterarVida(int valor) {
    setState(() {
      widget.vida += valor;
      (valor > 0)
          ? widget.histVida.add('+$valor')
          : widget.histVida.add('$valor');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: widget.bgColor),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Container(
                height: 400,
                width: 80,
                decoration: BoxDecoration(
                    color: widget.lifeColor,
                    borderRadius: BorderRadius.circular(8)),
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
            ),
            Row(
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
                  width: 72,
                  height: 72,
                  decoration: BoxDecoration(
                      color: widget.lifeColor,
                      borderRadius: BorderRadius.circular(8)),
                  child: Center(
                    child: Text(
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 24),
                      widget.vida.toString(),
                    ),
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
          ],
        ),
      ),
    );
  }
}
