import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/Movies%20Module/Domain/entities/movie.dart';
import 'package:movie_app/Movies%20Module/presentation/viewmodel/movies_cubit.dart';
import 'package:movie_app/Movies%20Module/presentation/viewmodel/movies_state.dart';
import 'package:movie_app/Movies%20Module/presentation/viewmodel/wishlist_cubit.dart';
import 'package:movie_app/Movies%20Module/presentation/widgets/custom_bottom_nav_bar.dart';
import 'package:movie_app/Movies%20Module/presentation/widgets/upcoming_slider.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/core/utils/toast_utils.dart';

class MovieDetailsScreen extends StatefulWidget {
  final Movie movie;

  MovieDetailsScreen({
    super.key,
    required this.movie,
  });

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  final ToastUtils _toastUtils = GetIt.I<ToastUtils>();

  @override
  Widget build(BuildContext context) {
    // Trigger similar movies fetch when screen builds
    context.read<MoviesCubit>().getSimilarMovies(widget.movie.genreIds,
        currentMovieId: widget.movie.id);

    return Scaffold(
      bottomNavigationBar: const CustomBottomNavBar(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            expandedHeight: 400,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    widget.movie.getBackdropUrl(),
                    fit: BoxFit.cover,
                  ),
                  // Gradient overlay
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.8),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.movie.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      ActionButton(
                        icon: context
                                .watch<WishlistCubit>()
                                .isInWishlist(widget.movie)
                            ? Icons.favorite
                            : Icons.favorite_outline,
                        onPressed: () {
                          final wishlistCubit = context.read<WishlistCubit>();
                          if (wishlistCubit.isInWishlist(widget.movie)) {
                            wishlistCubit.removeFromWishlist(widget.movie);
                            _toastUtils
                                .showSuccessToast('Removed from Wishlist!');
                          } else {
                            wishlistCubit.addToWishlist(widget.movie);
                            _toastUtils.showSuccessToast('Added to Wishlist!');
                          }
                        },
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          widget.movie.releaseDate.substring(0, 4),
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 12,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 20,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        widget.movie.voteAverage.toStringAsFixed(1),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Overview',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.movie.overview,
                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'More Like This',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 200,
                    child: BlocBuilder<MoviesCubit, MoviesState>(
                      buildWhen: (previous, current) =>
                          previous.similarMoviesState !=
                              current.similarMoviesState ||
                          previous.similarMovies != current.similarMovies,
                      builder: (context, state) {
                        switch (state.similarMoviesState) {
                          case RequestState.loading:
                            return const Center(
                              child: CircularProgressIndicator(),
                            );

                          case RequestState.loaded:
                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: state.similarMovies.length,
                              itemBuilder: (context, index) {
                                final similarMovie = state.similarMovies[index];
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            MovieDetailsScreen(
                                          movie: similarMovie,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    width: 140,
                                    margin: const EdgeInsets.only(right: 16),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.1),
                                          blurRadius: 8,
                                          offset: const Offset(0, 4),
                                        ),
                                      ],
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Stack(
                                        fit: StackFit.expand,
                                        children: [
                                          similarMovie.backdropPath.isEmpty
                                              ? Container(
                                                  color: Colors.grey[300],
                                                  child: const Icon(
                                                    Icons.movie,
                                                    size: 40,
                                                    color: Colors.grey,
                                                  ),
                                                )
                                              : Image.network(
                                                  similarMovie.getBackdropUrl(),
                                                  fit: BoxFit.cover,
                                                  errorBuilder: (context, error,
                                                      stackTrace) {
                                                    return Container(
                                                      color: Colors.grey[300],
                                                      child: const Icon(
                                                        Icons.error_outline,
                                                        size: 40,
                                                        color: Colors.grey,
                                                      ),
                                                    );
                                                  },
                                                ),
                                          Container(
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                                colors: [
                                                  Colors.transparent,
                                                  Colors.black.withOpacity(0.8),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 8,
                                            left: 8,
                                            right: 8,
                                            child: Text(
                                              similarMovie.title,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                              ),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );

                          case RequestState.error:
                            return Center(
                              child: Text(
                                state.similarMoviesMessage,
                                style: TextStyle(color: Colors.red[600]),
                              ),
                            );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
