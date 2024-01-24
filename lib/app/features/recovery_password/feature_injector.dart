import 'package:juntos_app/app/features/recovery_password/domain/usecases/usecases.dart';
import 'package:juntos_app/injection_container.dart';

Future<void> initRecoveryPasswordDependencies() async {
  getIt.registerLazySingleton<RecoveryPassword>(
    () => RecoveryPassword(getIt.call()),
  );
}
