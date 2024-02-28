import 'package:flutter/material.dart';
import 'package:overlay_creator/overlay_creator.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Homepage(),
    );
  }
}

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Example"),
      ),
      body: ElevatedButton(onPressed: () {}, child: const Text("Show Overlay")),
    );
  }
}
