import 'package:dio/dio.dart';
import 'package:juntos_app/app/features/purchases/data/datasources/datasources.dart';
import 'package:juntos_app/app/features/purchases/data/repositories/repositories_impl.dart';
import 'package:juntos_app/app/features/purchases/domain/repositories/repositories.dart';
import 'package:juntos_app/app/features/purchases/domain/usecases/usecases.dart';
import 'package:juntos_app/injection_container.dart';

Future<void> initPurchasesDependencies() async {
  getIt
    ..registerLazySingleton<IPurchasesDatasource>(
      () => PurchasesDatasource(
        dio: getIt<Dio>(),
      ),
    )
    ..registerLazySingleton<IPurchasesRepository>(
      () => PurchasesRepositoryImpl(getIt.call()),
    )
    ..registerLazySingleton<GetPurchases>(
      () => GetPurchases(getIt.call()),
    );
}
