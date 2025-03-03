import 'package:injectable/injectable.dart';
import 'package:movie_app/Movies%20Module/Domain/entities/movie.dart';
import 'package:movie_app/Movies%20Module/Domain/repositories/movie_repository.dart';
import 'package:movie_app/core/utils/result.dart';

@injectable
class GetMovieDetailsUsecase {
  final MovieRepository movieRepository;

  GetMovieDetailsUsecase(this.movieRepository);

  Future<Result<Movie>> execute(int id) async {
    return movieRepository.getMovieDetails(id);
  }
}
