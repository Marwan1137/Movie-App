import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/Movies%20Module/Domain/usecases/get_now_playing_movies.dart';
import 'package:movie_app/Movies%20Module/Domain/usecases/get_popular_movies.dart';
import 'package:movie_app/Movies%20Module/Domain/usecases/get_top_rated_movies.dart';
import 'package:movie_app/Movies%20Module/Domain/usecases/get_upcoming_movies_usecase.dart';
import 'package:movie_app/Movies%20Module/presentation/viewmodel/movies_state.dart';
import 'package:movie_app/core/utils/enums.dart';

@injectable
class MoviesCubit extends Cubit<MoviesState> {
  final GetNowPlayingMoviesUsecase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUsecase getPopularMoviesUseCase;
  final GetTopRatedMoviesUsecase getTopRatedMoviesUseCase;
  final GetUpcomingMoviesUsecase getUpcomingMoviesUsecase;

  MoviesCubit(
    this.getNowPlayingMoviesUseCase,
    this.getPopularMoviesUseCase,
    this.getTopRatedMoviesUseCase,
    this.getUpcomingMoviesUsecase,
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
}
