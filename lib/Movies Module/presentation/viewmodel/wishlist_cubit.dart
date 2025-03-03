import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Movies%20Module/Domain/entities/movie.dart';

class WishlistCubit extends Cubit<List<Movie>> {
  WishlistCubit() : super([]);

  void addToWishlist(Movie movie) {
    if (!state.any((m) => m.id == movie.id)) {
      emit([...state, movie]);
    }
  }

  void removeFromWishlist(Movie movie) {
    emit(state.where((m) => m.id != movie.id).toList());
  }

  bool isInWishlist(Movie movie) {
    return state.any((m) => m.id == movie.id);
  }
}