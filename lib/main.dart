import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/Movies%20Module/presentation/screens/home_screen.dart';
import 'package:movie_app/Movies%20Module/presentation/viewmodel/movies_cubit.dart';
import 'package:movie_app/core/DI/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<MoviesCubit>(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Movie App',
        home: MovieScreen(),
      ),
    );
  }
}
