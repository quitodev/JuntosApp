import 'package:dio/dio.dart';
import 'package:juntos_app/app/features/radio/data/datasources/datasources.dart';
import 'package:juntos_app/app/features/radio/data/repositories/repositories_impl.dart';
import 'package:juntos_app/app/features/radio/domain/repositories/repositories.dart';
import 'package:juntos_app/app/features/radio/domain/usecases/usecases.dart';
import 'package:juntos_app/injection_container.dart';

Future<void> initRadioDependencies() async {
  getIt
    ..registerLazySingleton<IRadioDatasource>(
      () => RadioDatasource(
        dio: getIt<Dio>(),
      ),
    )
    ..registerLazySingleton<IRadioRepository>(
      () => RadioRepositoryImpl(getIt.call()),
    )
    ..registerLazySingleton<GetRadio>(
      () => GetRadio(getIt.call()),
    );
}
