import 'package:movie_app/Movies%20Module/Domain/entities/movie.dart';
import 'package:movie_app/Movies%20Module/Domain/repositories/movie_repository.dart';

class GetPopularMovies {
  final MovieRepository movieRepository;

  GetPopularMovies(this.movieRepository);

  Future<List<Movie>> execute() async {
    return movieRepository.getPopularMovies();
  }
}
