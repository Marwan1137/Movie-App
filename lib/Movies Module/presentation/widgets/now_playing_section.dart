import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Movies%20Module/presentation/viewmodel/movies_cubit.dart';
import 'package:movie_app/Movies%20Module/presentation/viewmodel/movies_state.dart';
import 'package:movie_app/Movies%20Module/presentation/widgets/see_all_movies_button_screen.dart';
import 'package:movie_app/core/utils/enums.dart';

class NowPlayingSection extends StatelessWidget {
  const NowPlayingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesCubit, MoviesState>(
      buildWhen: (previous, current) =>
          previous.nowPlaying != current.nowPlaying,
      builder: (context, state) {
        switch (state.nowPlaying) {
          case RequestState.loading:
            return const Center(child: CircularProgressIndicator());

          case RequestState.loaded:
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Now Playing',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SeeAllButtonScreen(
                                movies: state.nowPlayingMovies,
                                pageTitle: 'Now Playing Movies',
                              ),
                            ),
                          );
                        },
                        child: const Text('See all'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: state.nowPlayingMovies.take(5).length,
                    itemBuilder: (context, index) {
                      final movie = state.nowPlayingMovies[index];
                      return Container(
                        width: 140,
                        margin: const EdgeInsets.only(right: 15),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                    image: NetworkImage(movie.getBackdropUrl()),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    movie.title,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        movie.releaseDate
                                            .substring(0, 4), // Gets just YYYY
                                        style: TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: 12,
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      const Icon(Icons.star,
                                          size: 12, color: Colors.amber),
                                      Text(
                                        movie.voteAverage.toStringAsFixed(1),
                                        style: TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            );

          case RequestState.error:
            return Center(child: Text(state.popularMessage));
        }
      },
    );
  }
}
