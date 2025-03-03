import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Movies%20Module/presentation/widgets/upcoming_slider.dart';
import 'package:movie_app/Movies Module/presentation/widgets/now_playing_section.dart';
import 'package:movie_app/Movies Module/presentation/widgets/popular_section.dart';
import 'package:movie_app/Movies Module/presentation/widgets/top_rated_section.dart';
import 'package:movie_app/Movies Module/presentation/widgets/custom_bottom_nav_bar.dart';
import 'package:movie_app/Movies%20Module/presentation/viewmodel/movies_cubit.dart';
import 'package:movie_app/Movies%20Module/presentation/viewmodel/movies_state.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Add this to trigger data loading when screen builds
    context.read<MoviesCubit>()
      ..getNowPlayingMovies()
      ..getPopularMovies()
      ..getTopRatedMovies()
      ..getUpcomingMovies();

    return BlocConsumer<MoviesCubit, MoviesState>(
        builder: (context, state) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  UpComingSlider(),
                  SizedBox(height: 20),
                  NowPlayingSection(),
                  SizedBox(height: 20),
                  PopularSection(),
                  SizedBox(height: 20),
                  TopRatedSection(),
                ],
              ),
            ),
            bottomNavigationBar: const CustomBottomNavBar(),
          );
        },
        listener: (context, state) {});
  }
}
