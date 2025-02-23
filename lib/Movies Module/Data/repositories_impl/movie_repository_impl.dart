import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/Movies%20Module/Data/datasource/movie_remote_datasource.dart';
import 'package:movie_app/Movies%20Module/Domain/entities/movie.dart';
import 'package:movie_app/Movies%20Module/Domain/repositories/movie_repository.dart';
import 'package:movie_app/core/error/failures.dart';

@Injectable(as: MovieRepository)
class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDatasource remoteDatasource;

  MovieRepositoryImpl(this.remoteDatasource);

  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async {
    try {
      final result = await remoteDatasource.getNowPlayingMovies();
      return Right(result);
    } catch (e) {
      if (e.toString().contains('Connection')) {
        return const Left(ConnectionFailure('No internet connection'));
      }
      return const Left(ServerFailure('Something went wrong'));
    }
  }

  @override
  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    try {
      final result = await remoteDatasource.getPopularMovies();
      return Right(result);
    } catch (e) {
      if (e.toString().contains('Connection')) {
        return const Left(ConnectionFailure('No internet connection'));
      }
      return const Left(ServerFailure('Something went wrong'));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    try {
      final result = await remoteDatasource.getTopRatedMovies();
      return Right(result);
    } catch (e) {
      if (e.toString().contains('Connection')) {
        return const Left(ConnectionFailure('No internet connection'));
      }
      return const Left(ServerFailure('Something went wrong'));
    }
  }
}
