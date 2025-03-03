import 'package:dio/dio.dart';
import 'package:movie_app/core/API/api_client.dart';
import 'package:movie_app/core/constants/constants.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ApiClient)
class DioClient implements ApiClient {
  final Dio _dio;
  DioClient()
      : _dio = Dio(
          BaseOptions(
            baseUrl: Constants.baseUrl,
            connectTimeout: const Duration(seconds: 30),
            receiveTimeout: const Duration(seconds: 30),
          ),
        );

  @override
  Future<dynamic> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.get(path, queryParameters: queryParameters);
      return response.data;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Exception _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioException.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return Exception('Connection Timeout');
      case DioExceptionType.badResponse:
        return Exception('Server error');
      case DioExceptionType.connectionError:
        return Exception('No internet connection');
      default:
        return Exception('Something went wrong');
    }
  }
}
