import 'package:juntos_app/app/features/profile/domain/usecases/usecases.dart';
import 'package:juntos_app/injection_container.dart';

Future<void> initProfileDependencies() async {
  getIt.registerLazySingleton<UpdateUser>(
    () => UpdateUser(getIt.call()),
  );
}
