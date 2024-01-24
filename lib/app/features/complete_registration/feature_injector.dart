import 'package:juntos_app/app/features/complete_registration/domain/usecases/usecases.dart';
import 'package:juntos_app/injection_container.dart';

Future<void> initCompleteRegistrationDependencies() async {
  getIt
    ..registerLazySingleton<VerifyEmail>(
      () => VerifyEmail(getIt.call()),
    )
    ..registerLazySingleton<ResendCode>(
      () => ResendCode(getIt.call()),
    );
}
