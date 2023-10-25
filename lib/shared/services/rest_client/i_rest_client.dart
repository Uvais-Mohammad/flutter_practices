import 'package:http/http.dart' as http;

abstract class IRestClient {
  Future<http.Response> get(String url, {int maxRetryCount = 1});
}
