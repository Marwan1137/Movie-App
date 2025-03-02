import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/Movies%20Module/presentation/screens/movie_details_screen.dart';
import 'package:movie_app/Movies%20Module/presentation/viewmodel/movies_cubit.dart';
import 'package:movie_app/Movies%20Module/presentation/viewmodel/movies_state.dart';
import 'package:movie_app/Movies%20Module/presentation/viewmodel/wishlist_cubit.dart';
import 'package:movie_app/core/services/share_service.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/core/utils/toast_utils.dart';

class UpComingSlider extends StatefulWidget {
  const UpComingSlider({super.key});

  @override
  State<UpComingSlider> createState() => _UpComingSliderState();
}

class _UpComingSliderState extends State<UpComingSlider> {
  int _currentIndex = 0;
  final ShareService _shareService = GetIt.I<ShareService>();
  final ToastUtils _toastUtils = GetIt.I<ToastUtils>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesCubit, MoviesState>(
      buildWhen: (previous, current) => previous.upComing != current.upComing,
      builder: (context, state) {
        switch (state.upComing) {
          case RequestState.loading:
            return const Center(child: CircularProgressIndicator());

          case RequestState.loaded:
            return Stack(
              children: [
                CarouselSlider.builder(
                  itemCount: state.upComingMovies.length,
                  itemBuilder: (context, index, _) {
                    final movie = state.upComingMovies[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MovieDetailsScreen(
                              movie: movie,
                            ),
                          ),
                        );
                      },
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MovieDetailsScreen(
                                movie: movie,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            image: DecorationImage(
                              image: NetworkImage(movie.getBackdropUrl()),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  options: CarouselOptions(
                    height: 400,
                    viewportFraction: 1.0,
                    autoPlay: true,
                    enableInfiniteScroll: true,
                    onPageChanged: (index, _) =>
                        setState(() => _currentIndex = index),
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 20,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                    onPressed: () {},
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black87,
                          Colors.transparent,
                        ],
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.upComingMovies[_currentIndex].title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(Icons.star,
                                size: 16, color: Colors.amber),
                            const SizedBox(width: 8),
                            Text(
                              state.upComingMovies[_currentIndex].voteAverage
                                  .toStringAsFixed(1),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            // ActionButton(
                            //   icon: Icons.favorite_border,
                            //   onPressed: () {
                            //     try {
                            //       _toastUtils
                            //           .showSuccessToast('Added to Wishlist!');
                            //     } catch (e) {
                            //       debugPrint('Error showing toast: $e');
                            //     }
                            //   },
                            // ),
                            ActionButton(
                              icon: Icons.share,
                              onPressed: () async {
                                try {
                                  await _shareService.shareMovie(
                                    title: state
                                        .upComingMovies[_currentIndex].title,
                                    overview: state
                                        .upComingMovies[_currentIndex].overview,
                                  );
                                } catch (e) {
                                  await _toastUtils.showErrorToast(
                                    'Failed to share movie',
                                  );
                                }
                              },
                            ),
                            // In the ActionButton for favorite, replace the existing onPressed with:
                            ActionButton(
                              icon: context.watch<WishlistCubit>().isInWishlist(
                                      state.upComingMovies[_currentIndex])
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              onPressed: () {
                                final movie =
                                    state.upComingMovies[_currentIndex];
                                final wishlistCubit =
                                    context.read<WishlistCubit>();

                                if (wishlistCubit.isInWishlist(movie)) {
                                  wishlistCubit.removeFromWishlist(movie);
                                  _toastUtils.showSuccessToast(
                                      'Removed from Wishlist!');
                                } else {
                                  wishlistCubit.addToWishlist(movie);
                                  _toastUtils
                                      .showSuccessToast('Added to Wishlist!');
                                }
                              },
                            ),
                            ActionButton(
                              icon: Icons.play_circle_filled,
                              isPlay: true,
                              onPressed: () {
                                // Play functionality will be implemented later
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          case RequestState.error:
            return Text(state.nowPlayingMessage);
        }
      },
    );
  }
}

class ActionButton extends StatelessWidget {
  final IconData icon;
  final bool isPlay;
  final VoidCallback? onPressed;

  const ActionButton({
    super.key,
    required this.icon,
    this.isPlay = false,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isPlay ? Colors.red : Colors.white,
      ),
      child: IconButton(
        icon: Icon(icon, color: isPlay ? Colors.white : Colors.black),
        onPressed: onPressed,
      ),
    );
  }
}
