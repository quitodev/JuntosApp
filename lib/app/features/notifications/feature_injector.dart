import 'package:dio/dio.dart';
import 'package:juntos_app/app/features/notifications/data/datasources/datasources.dart';
import 'package:juntos_app/app/features/notifications/data/repositories/repositories_impl.dart';
import 'package:juntos_app/app/features/notifications/domain/repositories/repositories.dart';
import 'package:juntos_app/app/features/notifications/domain/usecases/usecases.dart';
import 'package:juntos_app/injection_container.dart';

Future<void> initNotificationsDependencies() async {
  getIt
    ..registerLazySingleton<INotificationsDatasource>(
      () => NotificationsDatasource(
        dio: getIt<Dio>(),
      ),
    )
    ..registerLazySingleton<INotificationsRepository>(
      () => NotificationsRepositoryImpl(getIt.call()),
    )
    ..registerLazySingleton<GetNotifications>(
      () => GetNotifications(getIt.call()),
    );
}
