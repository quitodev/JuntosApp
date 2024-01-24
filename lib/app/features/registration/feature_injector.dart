import 'package:juntos_app/app/features/registration/domain/usecases/usecases.dart';
import 'package:juntos_app/injection_container.dart';

Future<void> initRegistrationDependencies() async {
  getIt.registerLazySingleton<SignUp>(
    () => SignUp(getIt.call()),
  );
}
