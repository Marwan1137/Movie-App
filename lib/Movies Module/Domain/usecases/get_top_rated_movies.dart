import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/Movies%20Module/Domain/entities/movie.dart';
import 'package:movie_app/Movies%20Module/Domain/repositories/movie_repository.dart';
import 'package:movie_app/core/error/failures.dart';

@injectable
class GetTopRatedMovies {
  final MovieRepository movieRepository;

  GetTopRatedMovies(this.movieRepository);

  Future<Future<Either<Failure, List<Movie>>>> execute() async {
    return movieRepository.getTopRatedMovies();
  }
}
