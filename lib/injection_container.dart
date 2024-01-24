import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:juntos_app/app/core/feature_injector.dart';
import 'package:juntos_app/app/core/utils/utils.dart';
import 'package:juntos_app/app/features/benefits/feature_injector.dart';
import 'package:juntos_app/app/features/board/feature_injector.dart';
import 'package:juntos_app/app/features/complete_registration/feature_injector.dart';
import 'package:juntos_app/app/features/giveaways/feature_injector.dart';
import 'package:juntos_app/app/features/home/feature_injector.dart';
import 'package:juntos_app/app/features/notifications/feature_injector.dart';
import 'package:juntos_app/app/features/profile/feature_injector.dart';
import 'package:juntos_app/app/features/purchases/feature_injector.dart';
import 'package:juntos_app/app/features/recovery_password/feature_injector.dart';
import 'package:juntos_app/app/features/registration/feature_injector.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  await initServices();
  await initCoreDependencies();
  await initRecoveryPasswordDependencies();
  await initRegistrationDependencies();
  await initCompleteRegistrationDependencies();
  await initHomeDependencies();
  await initBoardDependencies();
  await initGiveawaysDependencies();
  await initBenefitsDependencies();
  await initNotificationsDependencies();
  await initProfileDependencies();
  await initPurchasesDependencies();
  //await initRadioDependencies();
}

Future<void> initServices() async {
  getIt
    ..registerLazySingleton(
      Connectivity.new,
    )
    ..registerLazySingleton(
      () => Dio(
        BaseOptions(
          baseUrl: Api.baseUrl,
          headers: {
            'Accept': 'application/json',
            'accept-language': 'es',
          },
          contentType: 'application/json',
        ),
      ),
    );
}
