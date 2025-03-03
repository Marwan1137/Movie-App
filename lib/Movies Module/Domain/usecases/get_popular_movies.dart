import 'package:injectable/injectable.dart';
import 'package:movie_app/Movies%20Module/Domain/entities/movie.dart';
import 'package:movie_app/Movies%20Module/Domain/repositories/movie_repository.dart';
import 'package:movie_app/core/utils/result.dart';

@injectable
class GetPopularMoviesUsecase {
  final MovieRepository movieRepository;

  GetPopularMoviesUsecase(this.movieRepository);

  Future<Result<List<Movie>>> execute() async {
    return movieRepository.getPopularMovies();
  }
}
