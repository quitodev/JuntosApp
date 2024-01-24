import 'package:dio/dio.dart';
import 'package:juntos_app/app/features/giveaways/data/datasources/datasources.dart';
import 'package:juntos_app/app/features/giveaways/data/repositories/repositories_impl.dart';
import 'package:juntos_app/app/features/giveaways/domain/repositories/repositories.dart';
import 'package:juntos_app/app/features/giveaways/domain/usecases/usecases.dart';
import 'package:juntos_app/injection_container.dart';

Future<void> initGiveawaysDependencies() async {
  getIt
    ..registerLazySingleton<IGiveawaysDatasource>(
      () => GiveawaysDatasource(
        dio: getIt<Dio>(),
      ),
    )
    ..registerLazySingleton<IGiveawaysRepository>(
      () => GiveawaysRepositoryImpl(getIt.call()),
    )
    ..registerLazySingleton<GetGiveaways>(
      () => GetGiveaways(getIt.call()),
    )
    ..registerLazySingleton<GiveawayShared>(
      () => GiveawayShared(getIt.call()),
    );
}
