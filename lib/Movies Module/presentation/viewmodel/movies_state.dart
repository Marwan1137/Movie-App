import 'package:equatable/equatable.dart';
import 'package:movie_app/Movies%20Module/Domain/entities/movie.dart';
import 'package:movie_app/core/utils/enums.dart';

class MoviesState extends Equatable {
  final List<Movie> nowPlayingMovies;
  final List<Movie> popularMovies;
  final List<Movie> topRatedMovies;
  final List<Movie> upComingMovies;

  final RequestState nowPlaying;
  final RequestState popular;
  final RequestState topRated;
  final RequestState upComing;

  final String nowPlayingMessage;
  final String popularMessage;
  final String topRatedMessage;
  final String upComingMessage;
  const MoviesState({
    this.nowPlayingMovies = const [],
    this.popularMovies = const [],
    this.topRatedMovies = const [],
    this.upComingMovies = const [],
    this.nowPlaying = RequestState.loading,
    this.popular = RequestState.loading,
    this.topRated = RequestState.loading,
    this.upComing = RequestState.loading,
    this.nowPlayingMessage = '',
    this.popularMessage = '',
    this.topRatedMessage = '',
    this.upComingMessage = '',
  });

  MoviesState copyWith({
    List<Movie>? nowPlayingMovies,
    List<Movie>? popularMovies,
    List<Movie>? topRatedMovies,
    List<Movie>? upComingMovies,
    RequestState? nowPlayingState,
    RequestState? popularState,
    RequestState? topRatedState,
    RequestState? upComingState,
    String? nowPlayingMessage,
    String? popularMessage,
    String? topRatedMessage,
    String? upComingMessage,
  }) {
    return MoviesState(
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      popularMovies: popularMovies ?? this.popularMovies,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      upComingMovies: upComingMovies ?? this.upComingMovies,
      nowPlaying: nowPlayingState ?? nowPlaying,
      popular: popularState ?? popular,
      topRated: topRatedState ?? topRated,
      upComing: upComingState ?? upComing,
      nowPlayingMessage: nowPlayingMessage ?? this.nowPlayingMessage,
      popularMessage: popularMessage ?? this.popularMessage,
      topRatedMessage: topRatedMessage ?? this.topRatedMessage,
      upComingMessage: upComingMessage ?? this.upComingMessage,
    );
  }

  @override
  List<Object?> get props => [
        nowPlayingMovies,
        popularMovies,
        topRatedMovies,
        upComingMovies,
        nowPlaying,
        popular,
        topRated,
        upComing,
        nowPlayingMessage,
        popularMessage,
        topRatedMessage,
        upComingMessage,
      ];
}
