import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                  onPressed: () {},
                  child: const Text("1. Builder Pattern Flutter")),
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  "2. Asynchronous generator with bloc including with transformers",
                  textAlign: TextAlign.center,
                ),
              ),
              ElevatedButton(
                  onPressed: () {},
                  child: const Text("3. Render objects with custom paints")),
              ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                      "4. Bouncing sticky header with infinite list")),
              ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                      "5. Retry policy by calling an API if failed")),
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  "6. Navigate between screens using Navigation 2.0 (Auto Route)",
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
