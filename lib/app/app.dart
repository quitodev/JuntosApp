import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:juntos_app/app/core/presentation/widgets/widgets.dart';
import 'package:juntos_app/app/core/routes/app_router.dart';
import 'package:juntos_app/app/core/theme/theme.dart';
import 'package:juntos_app/app/core/utils/utils.dart';
import 'package:juntos_app/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({
    super.key,
    this.flavor = Flavor.development,
  });

  final Flavor flavor;

  @override
  Widget build(BuildContext context) {
    return CustomFlavorBanner(
      flavor: flavor,
      child: ScreenUtilInit(
        designSize: const Size(1920, 1080),
        child: MaterialApp.router(
          //title: 'Juntos',
          theme: AppThemes.lightTheme,
          routerConfig: AppRouter.router,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            FormBuilderLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
        ),
      ),
    );
  }
}
