import 'package:flutter/material.dart';
import './life_button.dart';

class PlayerLife extends StatefulWidget {
  final Color? lifeColor;
  final Color? bgColor;
  final Function alterarVida;
  int calculoVida = 0;
  int vida;

  PlayerLife({
    super.key,
    required this.lifeColor,
    required this.bgColor,
    required this.alterarVida,
    required this.vida,
  });

  @override
  PlayerLifeState createState() => PlayerLifeState();
}

class PlayerLifeState extends State<PlayerLife> {

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LifeButton(
                texto: '-1',
                onPressed: () {
                  widget.alterarVida(-1);
                  },
                color: widget.bgColor),
            LifeButton(
                texto: '-2',
                onPressed: () {
                  widget.alterarVida(-2);
                },
                color: widget.bgColor),
            LifeButton(
                texto: '-3',
                onPressed: () {
                  widget.alterarVida(-3);
                },
                color: widget.bgColor),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${widget.calculoVida}',style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                  color: widget.lifeColor, borderRadius: BorderRadius.circular(8)),
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
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LifeButton(
                texto: '+1',
                onPressed: () {
                  widget.alterarVida(1);
                },
                color: widget.bgColor),
            LifeButton(
                texto: '+2',
                onPressed: () {
                  widget.alterarVida(2);
                },
                color: widget.bgColor),
            LifeButton(
                texto: '+3',
                onPressed: () {
                  widget.alterarVida(3);
                },
                color: widget.bgColor),
          ],
        ),
      ],
    );
  }
  }