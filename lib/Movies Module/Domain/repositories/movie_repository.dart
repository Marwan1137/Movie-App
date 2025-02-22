import 'package:movie_app/Movies%20Module/Domain/entities/movie.dart';

abstract class MovieRepository {
  Future<List<Movie>> getNowPlayingMovies();

  Future<List<Movie>> getPopularMovies();

  Future<List<Movie>> getTopRatedMovies();
}
