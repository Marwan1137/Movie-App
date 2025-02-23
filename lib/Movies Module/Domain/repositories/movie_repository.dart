import 'package:movie_app/Movies%20Module/Domain/entities/movie.dart';
import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/failures.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();

  Future<Either<Failure, List<Movie>>> getPopularMovies();

  Future<Either<Failure, List<Movie>>> getTopRatedMovies();
}
