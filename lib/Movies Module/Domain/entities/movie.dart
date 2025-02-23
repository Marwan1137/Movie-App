import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final String title;
  final String overview;
  final List<int> genreIds;
  final String backdropPath;
  final double voteAverage;
  final double releaseDate;

  const Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.genreIds,
    required this.backdropPath,
    required this.voteAverage,
    required this.releaseDate,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        overview,
        genreIds,
        backdropPath,
        voteAverage,
        releaseDate,
      ];
}
