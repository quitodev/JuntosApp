import 'package:dio/dio.dart';
import 'package:juntos_app/app/features/board/data/datasources/datasources.dart';
import 'package:juntos_app/app/features/board/data/repositories/repositories_impl.dart';
import 'package:juntos_app/app/features/board/domain/repositories/repositories.dart';
import 'package:juntos_app/app/features/board/domain/usecases/usecases.dart';
import 'package:juntos_app/injection_container.dart';

Future<void> initBoardDependencies() async {
  getIt
    ..registerLazySingleton<IBoardDatasource>(
      () => BoardDatasource(
        dio: getIt<Dio>(),
      ),
    )
    ..registerLazySingleton<IBoardRepository>(
      () => BoardRepositoryImpl(getIt.call()),
    )
    ..registerLazySingleton<GetPosts>(
      () => GetPosts(getIt.call()),
    )
    ..registerLazySingleton<LikePost>(
      () => LikePost(getIt.call()),
    )
    ..registerLazySingleton<DislikePost>(
      () => DislikePost(getIt.call()),
    );
}
