import 'package:juntos_app/app/app.dart';
import 'package:juntos_app/app/core/utils/utils.dart';
import 'package:juntos_app/bootstrap.dart';

Future<void> main() async {
  await bootstrap(
    () => const App(
      flavor: Flavor.staging,
    ),
  );
}
