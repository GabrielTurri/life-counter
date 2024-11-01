import 'package:flutter/material.dart';

class LifeButton extends StatelessWidget {
  final String texto;
  final Function()? onPressed;

  const LifeButton({super.key, required this.texto, this.onPressed});
  
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed, child: Text(texto));
  }
}

