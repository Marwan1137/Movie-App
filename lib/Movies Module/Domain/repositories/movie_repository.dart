import 'package:movie_app/Movies%20Module/Domain/entities/movie.dart';
import 'package:movie_app/core/utils/result.dart';

abstract class MovieRepository {
  Future<Result<List<Movie>>> getNowPlayingMovies();

  Future<Result<List<Movie>>> getPopularMovies();

  Future<Result<List<Movie>>> getTopRatedMovies();

  Future<Result<List<Movie>>> getUpcomingMovies();

  Future<Result<List<Movie>>> searchMovies(String query);

  Future<Result<Movie>> getMovieDetails(int id);
}
