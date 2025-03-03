class Constants {
  static const String baseUrl = "https://api.themoviedb.org/3";
  static const String apiKey = "67aeb5c74092723ffcef8740ebc98934";
  static const String nowPlayingEndpoint = "/movie/now_playing";
  static const String popularMoviesEndpoint = "/movie/popular";
  static const String topRatedMoviesEndpoint = "/movie/top_rated";
  static const String upcomingMoviesEndpoint = "/movie/upcoming";
  static const String searchMoviesEndpoint = "/search/movie";
  static String movieDetailsEndpoint(int movieId) => "/movie/$movieId";
}
