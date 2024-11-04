import 'package:flutter/material.dart';

class LifeButton extends StatelessWidget {
  final String texto;
  final Color? color;
  final Function()? onPressed;

  const LifeButton(
      {super.key, required this.texto, this.onPressed, required this.color});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.all(8),
        ),
        child: Text(
          texto,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w800,
            color: color,
          ),
        ));
  }
}
