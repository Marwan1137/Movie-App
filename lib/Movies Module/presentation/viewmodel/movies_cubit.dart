import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/Movies%20Module/Domain/usecases/get_movie_details_usecase.dart';
import 'package:movie_app/Movies%20Module/Domain/usecases/get_now_playing_movies.dart';
import 'package:movie_app/Movies%20Module/Domain/usecases/get_popular_movies.dart';
import 'package:movie_app/Movies%20Module/Domain/usecases/get_top_rated_movies.dart';
import 'package:movie_app/Movies%20Module/Domain/usecases/get_upcoming_movies_usecase.dart';
import 'package:movie_app/Movies%20Module/Domain/usecases/search_movies_usecase.dart';
import 'package:movie_app/Movies%20Module/presentation/viewmodel/movies_state.dart';
import 'package:movie_app/core/utils/enums.dart';

@injectable
class MoviesCubit extends Cubit<MoviesState> {
  final GetNowPlayingMoviesUsecase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUsecase getPopularMoviesUseCase;
  final GetTopRatedMoviesUsecase getTopRatedMoviesUseCase;
  final GetUpcomingMoviesUsecase getUpcomingMoviesUsecase;
  final SearchMoviesUsecase searchMoviesUsecase;
  final GetMovieDetailsUsecase movieDetailsUsecase;

  MoviesCubit(
    this.getNowPlayingMoviesUseCase,
    this.getPopularMoviesUseCase,
    this.getTopRatedMoviesUseCase,
    this.getUpcomingMoviesUsecase,
    this.searchMoviesUsecase,
    this.movieDetailsUsecase,
  ) : super(const MoviesState());

  Future<void> getNowPlayingMovies() async {
    emit(state.copyWith(nowPlayingState: RequestState.loading));
    final result = await getNowPlayingMoviesUseCase.execute();
    if (result.isSuccess) {
      emit(state.copyWith(
        nowPlayingState: RequestState.loaded,
        nowPlayingMovies: result.data,
      ));
    } else {
      emit(state.copyWith(
        nowPlayingState: RequestState.error,
        nowPlayingMessage: result.error,
      ));
    }
  }

  Future<void> getPopularMovies() async {
    emit(state.copyWith(popularState: RequestState.loading));
    final result = await getPopularMoviesUseCase.execute();
    if (result.isSuccess) {
      emit(state.copyWith(
        popularState: RequestState.loaded,
        popularMovies: result.data,
      ));
    } else {
      emit(state.copyWith(
        popularState: RequestState.error,
        popularMessage: result.error,
      ));
    }
  }

  Future<void> getTopRatedMovies() async {
    emit(state.copyWith(topRatedState: RequestState.loading));
    final result = await getTopRatedMoviesUseCase.execute();
    if (result.isSuccess) {
      emit(state.copyWith(
        topRatedState: RequestState.loaded,
        topRatedMovies: result.data,
      ));
    } else {
      emit(state.copyWith(
        topRatedState: RequestState.error,
        topRatedMessage: result.error,
      ));
    }
  }

  Future<void> getUpcomingMovies() async {
    emit(state.copyWith(upComingState: RequestState.loading));
    final result = await getUpcomingMoviesUsecase.execute();
    if (result.isSuccess) {
      emit(state.copyWith(
        upComingState: RequestState.loaded,
        upComingMovies: result.data,
      ));
    } else {
      emit(state.copyWith(
        upComingState: RequestState.error,
        upComingMessage: result.error,
      ));
    }
  }

  Future<void> searchMovies(String query) async {
    emit(state.copyWith(searchState: RequestState.loading));
    // Debug log
    final result = await searchMoviesUsecase.execute(query);
    if (result.isSuccess) {
      // Debug log
      emit(state.copyWith(
        searchState: RequestState.loaded,
        searchResults: result.data,
      ));
    } else {
      // Debug log
      emit(state.copyWith(
        searchState: RequestState.error,
        searchMessage: result.error,
      ));
    }
  }

  Future<void> getSimilarMovies(List<int> genreIds, {int? currentMovieId}) async {
    emit(state.copyWith(similarMoviesState: RequestState.loading));

    final allMovies = [
      ...state.nowPlayingMovies,
      ...state.popularMovies,
      ...state.topRatedMovies,
      ...state.upComingMovies,
    ].toSet().toList();

    // Filter movies that share at least one genre
    final similarMovies = allMovies
        .where((movie) => 
            movie.genreIds.any((id) => genreIds.contains(id)) && // Has matching genre
            movie.id != currentMovieId) // Not the same movie
        .take(10)
        .toList();

    emit(state.copyWith(
      similarMoviesState: RequestState.loaded,
      similarMovies: similarMovies,
    ));
  }

  Future<void> getMovieDetails(int id) async {
    emit(state.copyWith(movieDetailsState: RequestState.loading));
    // Debug log
    final result = await movieDetailsUsecase.execute(id);
    if (result.isSuccess) {
      emit(state.copyWith(
        movieDetailsState: RequestState.loaded,
        movieDetails: result.data,
      ));
    } else {
      emit(state.copyWith(
        movieDetailsState: RequestState.error,
        movieDetailsMessage: result.error,
      ));
    }
  }

  void clearSearch() {
    emit(state.copyWith(
      searchState: RequestState.loading,
      searchResults: [],
      searchMessage: '',
    ));
  }
}
