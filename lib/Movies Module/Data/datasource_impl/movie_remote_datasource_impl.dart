import 'package:movie_app/Movies%20Module/Data/Model/movie_model.dart';
import 'package:movie_app/Movies%20Module/Data/datasource/movie_remote_datasource.dart';
import 'package:movie_app/core/API/api_client.dart';
import 'package:movie_app/core/constants/constants.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: MovieRemoteDatasource)
class MovieRemoteDatasourceImpl implements MovieRemoteDatasource {
  final ApiClient apiClient;
  MovieRemoteDatasourceImpl({
    required this.apiClient,
  });

  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    try {
      final response = await apiClient.get(Constants.nowPlayingEndpoint,
          queryParameters: {'api_key': Constants.apiKey});
      return (response['results'] as List)
          .map((movie) => MovieModel.fromJson(movie))
          .toList();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    try {
      final response = await apiClient.get(Constants.popularMoviesEndpoint,
          queryParameters: {'api_key': Constants.apiKey});
      return (response['results'] as List)
          .map((movie) => MovieModel.fromJson(movie))
          .toList();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    try {
      final response = await apiClient.get(Constants.topRatedMoviesEndpoint,
          queryParameters: {'api_key': Constants.apiKey});
      return (response['results'] as List)
          .map((movie) => MovieModel.fromJson(movie))
          .toList();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<List<MovieModel>> getUpcomingMovies() async {
    try {
      final response = await apiClient.get(Constants.upcomingMoviesEndpoint,
          queryParameters: {'api_key': Constants.apiKey});
      return (response['results'] as List)
          .map((movie) => MovieModel.fromJson(movie))
          .toList();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
