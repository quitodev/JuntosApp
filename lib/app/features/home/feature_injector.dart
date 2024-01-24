import 'package:dio/dio.dart';
import 'package:juntos_app/app/features/home/data/datasources/datasources.dart';
import 'package:juntos_app/app/features/home/data/repositories/repositories_impl.dart';
import 'package:juntos_app/app/features/home/domain/repositories/repositories.dart';
import 'package:juntos_app/app/features/home/domain/usecases/usecases.dart';
import 'package:juntos_app/injection_container.dart';

Future<void> initHomeDependencies() async {
  getIt
    ..registerLazySingleton<IHomeDatasource>(
      () => HomeDatasource(
        dio: getIt<Dio>(),
      ),
    )
    ..registerLazySingleton<IHomeRepository>(
      () => HomeRepositoryImpl(getIt.call()),
    )
    ..registerLazySingleton<GetBanners>(
      () => GetBanners(getIt.call()),
    )
    ..registerLazySingleton<GetWinners>(
      () => GetWinners(getIt.call()),
    );
}
