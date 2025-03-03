abstract class ApiClient {
  Future<dynamic> get(String path, {Map<String, dynamic>? queryParameters});
}
