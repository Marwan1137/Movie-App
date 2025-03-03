import 'package:movie_app/Movies%20Module/Domain/entities/movie.dart';
import 'package:movie_app/Movies%20Module/Domain/repositories/movie_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/utils/result.dart';

@injectable
class GetNowPlayingMoviesUsecase {
  final MovieRepository movieRepository;

  GetNowPlayingMoviesUsecase(this.movieRepository);

  Future<Result<List<Movie>>> execute() async {
    return await movieRepository.getNowPlayingMovies();
  }
}
