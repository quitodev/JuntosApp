import 'package:dio/dio.dart';
import 'package:juntos_app/app/core/data/datasources/datasources.dart';
import 'package:juntos_app/app/core/data/repositories/repositories_impl.dart';
import 'package:juntos_app/app/core/domain/repositories/repositories.dart';
import 'package:juntos_app/app/core/domain/usecases/usecases.dart';
import 'package:juntos_app/injection_container.dart';

Future<void> initCoreDependencies() async {
  await _initAuthDependencies();
  await _initUserDependencies();
}

Future<void> _initAuthDependencies() async {
  getIt
    ..registerLazySingleton<IAuthDatasource>(
      () => AuthDatasource(
        dio: getIt<Dio>(),
      ),
    )
    ..registerLazySingleton<IAuthRepository>(
      () => AuthRepositoryImpl(getIt.call()),
    )
    ..registerLazySingleton<SignIn>(
      () => SignIn(getIt.call()),
    );
}

Future<void> _initUserDependencies() async {
  getIt
    ..registerLazySingleton<IUserDatasource>(
      () => UserDatasource(
        dio: getIt<Dio>(),
      ),
    )
    ..registerLazySingleton<IUserRepository>(
      () => UserRepositoryImpl(getIt.call()),
    )
    ..registerLazySingleton<GetUser>(
      () => GetUser(getIt.call()),
    )
    ..registerLazySingleton<FindDocument>(
      () => FindDocument(getIt.call()),
    )
    ..registerLazySingleton<GetDepartments>(
      () => GetDepartments(getIt.call()),
    )
    ..registerLazySingleton<GetProvinces>(
      () => GetProvinces(getIt.call()),
    )
    ..registerLazySingleton<GetInstitutions>(
      () => GetInstitutions(getIt.call()),
    )
    ..registerLazySingleton<UploadAvatar>(
      () => UploadAvatar(getIt.call()),
    );
}
