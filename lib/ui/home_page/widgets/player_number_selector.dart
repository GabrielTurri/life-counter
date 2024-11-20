import 'package:flutter/material.dart';

class PlayerNumberSelector extends StatelessWidget {
  const PlayerNumberSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        FilledButton(
          onPressed: () {},
          child: const Text('2'),
        ),
        FilledButton(
          onPressed: () {},
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.grey)),
          child: const Text('3'),
        ),
        FilledButton(
          onPressed: () {},
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.grey)),
          child: const Text('4'),
        ),
      ],
    );
  }
}
