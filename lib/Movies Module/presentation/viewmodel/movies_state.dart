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

  final List<Movie> searchResults;
  final RequestState searchState;
  final String searchMessage;
  const MoviesState({
    this.nowPlayingMovies = const [],
    this.popularMovies = const [],
    this.topRatedMovies = const [],
    this.upComingMovies = const [],
    this.searchResults = const [],
    this.nowPlaying = RequestState.loading,
    this.popular = RequestState.loading,
    this.topRated = RequestState.loading,
    this.upComing = RequestState.loading,
    this.searchState = RequestState.loading,
    this.nowPlayingMessage = '',
    this.popularMessage = '',
    this.topRatedMessage = '',
    this.upComingMessage = '',
    this.searchMessage = '',
  });

  MoviesState copyWith({
    List<Movie>? nowPlayingMovies,
    List<Movie>? popularMovies,
    List<Movie>? topRatedMovies,
    List<Movie>? upComingMovies,
    List<Movie>? searchResults,
    RequestState? nowPlayingState,
    RequestState? popularState,
    RequestState? topRatedState,
    RequestState? upComingState,
    RequestState? searchState,
    String? nowPlayingMessage,
    String? popularMessage,
    String? topRatedMessage,
    String? upComingMessage,
    String? searchMessage,
  }) {
    return MoviesState(
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      popularMovies: popularMovies ?? this.popularMovies,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      upComingMovies: upComingMovies ?? this.upComingMovies,
      searchResults: searchResults ?? this.searchResults,
      nowPlaying: nowPlayingState ?? nowPlaying,
      popular: popularState ?? popular,
      topRated: topRatedState ?? topRated,
      upComing: upComingState ?? upComing,
      searchState: searchState ?? this.searchState,
      nowPlayingMessage: nowPlayingMessage ?? this.nowPlayingMessage,
      popularMessage: popularMessage ?? this.popularMessage,
      topRatedMessage: topRatedMessage ?? this.topRatedMessage,
      upComingMessage: upComingMessage ?? this.upComingMessage,
      searchMessage: searchMessage ?? this.searchMessage,
    );
  }

  @override
  List<Object?> get props => [
        nowPlayingMovies,
        popularMovies,
        topRatedMovies,
        upComingMovies,
        searchResults,
        nowPlaying,
        popular,
        topRated,
        upComing,
        searchState,
        nowPlayingMessage,
        popularMessage,
        topRatedMessage,
        upComingMessage,
        searchMessage
      ];
}
