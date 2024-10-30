import 'package:flutter/material.dart';

class Player1Life extends StatefulWidget {
  @override
  State<Player1Life> createState() {
    return Player1LifeState();
  }
}

class Player1LifeState extends State<Player1Life> {
  int _counter1 = 20;
  int _counter2 = 20;

  resetarVida() {
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
    return Container(
        decoration: BoxDecoration(color: Colors.orange[300]),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _reduceCounter(1);
                  },
                  child: const Text('-1'),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                  decoration: BoxDecoration(
                      color: Colors.orange[400],
                      borderRadius: BorderRadius.circular(8)),
                  child: Text(
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 24),
                    '$_counter1',
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      _incrementCounter(1);
                    },
                    child: const Text('+1')),
              ],
            ),
          ),
        ));
  }
}
