import 'package:aqary_test/shared/services/rest_client/i_rest_client.dart';
import 'package:aqary_test/shared/services/service_locator.dart';
import 'package:flutter/material.dart';

class RetryScreen extends StatefulWidget {
  const RetryScreen({super.key});

  @override
  State<RetryScreen> createState() => _RetryScreenState();
}

class _RetryScreenState extends State<RetryScreen> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    const correctUrl = 'https://jsonplaceholder.typicode.com/todos/12';
    const wrongUrl = 'https://jsonplaceholddddder.typicode.com/todos/1';
    var response = await serviceLocator<IRestClient>().get(
      wrongUrl,
      maxRetryCount: 5,
    );
    print('response $response');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Retry Screen'),
      ),
      body: const Center(
        child: Text(
          'Retry',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
