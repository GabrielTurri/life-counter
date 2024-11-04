import 'package:flutter/material.dart';
import 'package:life_counter/life_history.dart';
import './player_life.dart';

class PlayerLifeContainer extends StatefulWidget {
  final Color? lifeColor;
  final Color? bgColor;
  final int vidaInicial;
  int vida;
  var histVida = [];

  PlayerLifeContainer({
    super.key,
    required this.lifeColor,
    required this.bgColor,
    required this.vidaInicial,
  }) : vida = vidaInicial;

  @override
  PlayerLifeContainerState createState() => PlayerLifeContainerState();
}

class PlayerLifeContainerState extends State<PlayerLifeContainer> {
  resetarVida() {
    setState(() {
      widget.vida = widget.vidaInicial;
      widget.histVida.clear();
    });
  }

  void alterarVida(int valor) {
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
            PlayerLifeHistory(
              bgColor: widget.bgColor,
              lifeColor: widget.lifeColor,
              histVida: widget.histVida,
            ),
            PlayerLife(
              lifeColor: widget.lifeColor,
              bgColor: widget.bgColor,
              vidaInicial: widget.vidaInicial,
              alterarVida:  alterarVida,
            )
          ],
        ),
      ),
    );
  }
}
