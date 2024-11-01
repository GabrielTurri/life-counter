import 'package:flutter/material.dart';
import 'package:life_counter/player_life.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
  int _counter1 = 20;
  int _counter2 = 20;

  _resetCounters() {
    setState(() {
      _counter1 = 20;
      _counter2 = 20;
    });
  }

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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: PlayerLife(
                lifeColor: Colors.green[300],
                bgColor: Colors.green[400],
              ),
            ),
            Expanded(
              child: PlayerLife(
                  lifeColor: Colors.purple[300], bgColor: Colors.purple[400]),
            ),
          ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Reset',
        child: const Icon(Icons.restart_alt_outlined),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
