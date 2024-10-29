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

  _reduceCounter(player) {
    setState(() {
      (player == 1) ? _counter1-- : _counter2--;
    });
  }

  _incrementCounter(player) {
    setState(() {
      (player == 1) ? _counter1++ : _counter2++;
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
              child: Player1Life(),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(color: Colors.blue[300]),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            _reduceCounter(2);
                          },
                          child: const Text('-1'),
                        ),
                        Container(
                          child: Text('$_counter2'),
                          margin: const EdgeInsets.symmetric(horizontal: 16),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32, vertical: 16),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              _incrementCounter(2);
                            },
                            child: const Text('+1')),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ]),
      floatingActionButton: FloatingActionButton(
        onPressed: _resetCounters,
        tooltip: 'Reset',
        child: const Icon(Icons.restart_alt_outlined),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
