import 'dart:developer';

import 'package:aqary_test/shared/services/rest_client/i_rest_client.dart';
import 'package:http/http.dart' as http;

class RestClient implements IRestClient {
  @override
  Future<http.Response> get(String url, {int maxRetryCount = 1}) async {
    for (var i = 0; i < maxRetryCount; i++) {
      try {
        log('count ${i + 1}');
        final response = await http.get(
          Uri.parse(
            url,
          ),
        );
        log('response.statusCode ${response.statusCode}');
        log('response.body ${response.body}');
        return response;
      } catch (e) {
        log('error $e');
        continue;
      }
    }
    throw 'Failed to connect to server';
  }
}
