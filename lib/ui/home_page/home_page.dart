import 'package:flutter/material.dart';
import 'package:life_counter/ui/home_page/widgets/player_number_selector.dart';
import 'package:life_counter/ui/life_counter/life_counter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text(
            'Life Counter',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Número de jogadores',
              style: TextStyle(fontSize: 24),
            ),
            PlayerNumberSelector(),
            FilledButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => LifeCounterPage(),
                    ),
                  );
                },
                child: const Text('Entrar')),
          ],
        )));
  }
}
