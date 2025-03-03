import 'package:injectable/injectable.dart';
import 'package:movie_app/Movies%20Module/Data/datasource/movie_remote_datasource.dart';
import 'package:movie_app/Movies%20Module/Domain/entities/movie.dart';
import 'package:movie_app/Movies%20Module/Domain/repositories/movie_repository.dart';
import 'package:movie_app/core/utils/result.dart';

@Injectable(as: MovieRepository)
class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDatasource remoteDatasource;

  MovieRepositoryImpl(this.remoteDatasource);

  @override
  Future<Result<List<Movie>>> getNowPlayingMovies() async {
    try {
      final result = await remoteDatasource.getNowPlayingMovies();
      return Result.success(result);
    } catch (e) {
      return Result.failure(e.toString());
    }
  }

  @override
  Future<Result<List<Movie>>> getPopularMovies() async {
    try {
      final result = await remoteDatasource.getPopularMovies();
      return Result.success(result);
    } catch (e) {
      return Result.failure(e.toString());
    }
  }

  @override
  Future<Result<List<Movie>>> getTopRatedMovies() async {
    try {
      final result = await remoteDatasource.getTopRatedMovies();
      return Result.success(result);
    } catch (e) {
      return Result.failure(e.toString());
    }
  }

  @override
  Future<Result<List<Movie>>> getUpcomingMovies() async {
    try {
      final result = await remoteDatasource.getUpcomingMovies();
      return Result.success(result);
    } catch (e) {
      return Result.failure(e.toString());
    }
  }

  @override
  Future<Result<List<Movie>>> searchMovies(String query) async {
    try {
      final result = await remoteDatasource.searchMovies(query);
      return Result.success(result);
    } catch (e) {
      return Result.failure(e.toString());
    }
  }

  @override
  Future<Result<Movie>> getMovieDetails(int id) async {
    try {
      final result = await remoteDatasource.getMovieDetails(id);
      return Result.success(result);
    } catch (e) {
      return Result.failure(e.toString());
    }
  }
}
