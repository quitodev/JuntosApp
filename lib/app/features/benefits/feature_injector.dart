import 'package:dio/dio.dart';
import 'package:juntos_app/app/features/benefits/data/datasources/datasources.dart';
import 'package:juntos_app/app/features/benefits/data/repositories/repositories_impl.dart';
import 'package:juntos_app/app/features/benefits/domain/repositories/repositories.dart';
import 'package:juntos_app/app/features/benefits/domain/usecases/usecases.dart';
import 'package:juntos_app/injection_container.dart';

Future<void> initBenefitsDependencies() async {
  getIt
    ..registerLazySingleton<IBenefitsDatasource>(
      () => BenefitsDatasource(
        dio: getIt<Dio>(),
      ),
    )
    ..registerLazySingleton<IBenefitsRepository>(
      () => BenefitsRepositoryImpl(getIt.call()),
    )
    ..registerLazySingleton<GetCategories>(
      () => GetCategories(getIt.call()),
    )
    ..registerLazySingleton<GetBenefits>(
      () => GetBenefits(getIt.call()),
    )
    ..registerLazySingleton<BenefitUsed>(
      () => BenefitUsed(getIt.call()),
    );
}
