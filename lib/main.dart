import 'package:flutter/material.dart';
import 'package:life_counter/player_life_container.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  final int vidaInicial = 20;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Life Counter',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<PlayerLifeContainerState> player1Key =
      GlobalKey<PlayerLifeContainerState>();
  final GlobalKey<PlayerLifeContainerState> player2Key =
      GlobalKey<PlayerLifeContainerState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Center(
          child: Text(
            'Life Counter',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: PlayerLifeContainer(
              key: player1Key,
              lifeColor: Colors.green[300],
              bgColor: Colors.green[400],
              vidaInicial: 20,
            ),
          ),
          Expanded(
            child: PlayerLifeContainer(
              key: player2Key,
              lifeColor: Colors.purple[300],
              bgColor: Colors.purple[400],
              vidaInicial: 20,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          player1Key.currentState?.resetarVida();
          player2Key.currentState?.resetarVida();
        },
        tooltip: 'Reset',
        child: const Icon(Icons.restart_alt_outlined),
      ),
    );
  }
}
