import 'package:aqary_test/shared/router/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class FirstScreen extends StatefulWidget {
  const FirstScreen({
    super.key,
  });

  static const String path = '/first_screen';

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  String dataFromSecondScreen = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Screen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Hello, World!, I am the first screen',
            style: TextStyle(fontSize: 24),
          ),
          const SizedBox(
            height: 20,
            width: double.infinity,
          ),
          ElevatedButton(
            onPressed: () async {
              var data = await context.router
                  .push<String>(SecondRoute(data: 'Data from first screen'));
              setState(() {
                dataFromSecondScreen = data ?? '';
              });
            },
            child: const Text('Go to second screen'),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Data from second screen: \n',
            style: TextStyle(fontSize: 22),
          ),
          Text(
            dataFromSecondScreen,
            style: const TextStyle(fontSize: 28, color: Colors.red),
          ),
        ],
      ),
    );
  }
}
