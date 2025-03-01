// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../Movies%20Module/Data/datasource/movie_remote_datasource.dart'
    as _i463;
import '../../Movies%20Module/Data/datasource_impl/movie_remote_datasource_impl.dart'
    as _i904;
import '../../Movies%20Module/Data/repositories_impl/movie_repository_impl.dart'
    as _i188;
import '../../Movies%20Module/Domain/repositories/movie_repository.dart'
    as _i509;
import '../../Movies%20Module/Domain/usecases/get_now_playing_movies.dart'
    as _i112;
import '../../Movies%20Module/Domain/usecases/get_popular_movies.dart' as _i893;
import '../../Movies%20Module/Domain/usecases/get_top_rated_movies.dart'
    as _i241;
import '../../Movies%20Module/Domain/usecases/get_upcoming_movies_usecase.dart'
    as _i513;
import '../../Movies%20Module/Domain/usecases/search_movies_usecase.dart'
    as _i5;
import '../../Movies%20Module/presentation/viewmodel/movies_cubit.dart'
    as _i400;
import '../API/api_client.dart' as _i415;
import '../API/dio_client.dart' as _i68;
import '../services/share_service.dart' as _i474;
import '../utils/toast_utils.dart' as _i745;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i474.ShareService>(() => _i474.ShareService());
    gh.factory<_i745.ToastUtils>(() => _i745.ToastUtils());
    gh.factory<_i415.ApiClient>(() => _i68.DioClient());
    gh.factory<_i463.MovieRemoteDatasource>(() =>
        _i904.MovieRemoteDatasourceImpl(apiClient: gh<_i415.ApiClient>()));
    gh.factory<_i509.MovieRepository>(
        () => _i188.MovieRepositoryImpl(gh<_i463.MovieRemoteDatasource>()));
    gh.factory<_i112.GetNowPlayingMoviesUsecase>(
        () => _i112.GetNowPlayingMoviesUsecase(gh<_i509.MovieRepository>()));
    gh.factory<_i893.GetPopularMoviesUsecase>(
        () => _i893.GetPopularMoviesUsecase(gh<_i509.MovieRepository>()));
    gh.factory<_i241.GetTopRatedMoviesUsecase>(
        () => _i241.GetTopRatedMoviesUsecase(gh<_i509.MovieRepository>()));
    gh.factory<_i513.GetUpcomingMoviesUsecase>(
        () => _i513.GetUpcomingMoviesUsecase(gh<_i509.MovieRepository>()));
    gh.factory<_i5.SearchMoviesUsecase>(
        () => _i5.SearchMoviesUsecase(gh<_i509.MovieRepository>()));
    gh.factory<_i400.MoviesCubit>(() => _i400.MoviesCubit(
          gh<_i112.GetNowPlayingMoviesUsecase>(),
          gh<_i893.GetPopularMoviesUsecase>(),
          gh<_i241.GetTopRatedMoviesUsecase>(),
          gh<_i513.GetUpcomingMoviesUsecase>(),
          gh<_i5.SearchMoviesUsecase>(),
        ));
    return this;
  }
}
