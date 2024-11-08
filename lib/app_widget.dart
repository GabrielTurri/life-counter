import 'package:flutter/material.dart';
import 'package:life_counter/app_controller.dart';
import 'package:life_counter/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: AppController.instance,
      builder: (context, child) {
        return MaterialApp(
          title: 'Life Counter',
          theme: ThemeData(
            useMaterial3: true,
          ),
          home: const MyHomePage(),
        );
      },
    );
  }
}