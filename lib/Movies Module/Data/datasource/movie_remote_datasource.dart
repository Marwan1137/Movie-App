import 'package:movie_app/Movies%20Module/Data/Model/movie_model.dart';

abstract class MovieRemoteDatasource {
  Future<List<MovieModel>> getNowPlayingMovies();

  Future<List<MovieModel>> getPopularMovies();

  Future<List<MovieModel>> getTopRatedMovies();
}
