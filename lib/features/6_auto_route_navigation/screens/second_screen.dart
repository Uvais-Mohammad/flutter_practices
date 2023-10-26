import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage<String>()
class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key, required this.data});

  final String data;

  static const String path = '/second_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Hey!,$data ',
              style: const TextStyle(fontSize: 24),
            ),
          ),
          const SizedBox(
            height: 20,
            width: double.infinity,
          ),
          ElevatedButton(
            onPressed: () {
              context.router.pop('I am from second screen');
            },
            child: const Text('Go back to first screen'),
          ),
        ],
      ),
    );
  }
}
