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
                  child: Text('$_counter1'),
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
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
