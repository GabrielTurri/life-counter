import 'dart:async';

import 'package:flutter/material.dart';
import 'package:life_counter/player_life/life_history.dart';
import 'player_life.dart';
import 'package:life_counter/life_controller.dart';

class PlayerLifeContainer extends StatefulWidget {
  final Color? lifeColor;
  final Color? bgColor;
  final int vidaInicial;
  int vida;
  var histVida = [];
  int calculoVida = 0;
  String textCalculoVida = '';

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
      widget.textCalculoVida = '';
    });
  }

  final _timer = TimerVida(milliseconds: 1000);

  void alterarVida(int valor) {
    setState(() {
      widget.vida += valor;
      widget.calculoVida += valor;
      widget.textCalculoVida = (widget.calculoVida > 0)
          ? '+${widget.calculoVida}'
          : widget.calculoVida.toString();
    });

    _timer.run(() {
      calcularVida();
    });
  }

  void calcularVida() {
    setState(() {
      if (widget.calculoVida != 0) {
        widget.histVida.add(widget.textCalculoVida);
      }

      widget.calculoVida = 0;
      widget.textCalculoVida = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: widget.bgColor),
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: AnimatedBuilder(
              animation: PlayerLifeController.instance,
              builder: (context, child) {
                return Row(
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
                      vida: widget.vida,
                      alterarVida: alterarVida,
                      calculoVida: widget.textCalculoVida,
                    )
                  ],
                );
              })),
    );
  }
}

class TimerVida {
  final int milliseconds;
  Timer? _timer;

  TimerVida({required this.milliseconds});

  void run(VoidCallback action) {
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
