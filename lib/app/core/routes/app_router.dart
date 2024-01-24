import 'package:go_router/go_router.dart';
import 'package:juntos_app/app/core/domain/entities/entities.dart';
import 'package:juntos_app/app/core/presentation/pages/pages.dart';
import 'package:juntos_app/app/core/presentation/widgets/widgets.dart';
import 'package:juntos_app/app/core/utils/utils.dart';
import 'package:juntos_app/app/features/benefits/benefits.dart';
import 'package:juntos_app/app/features/benefits/domain/entities/entities.dart';
import 'package:juntos_app/app/features/complete_registration/complete_registration.dart';
import 'package:juntos_app/app/features/giveaways/domain/entities/entities.dart';
import 'package:juntos_app/app/features/giveaways/giveaways.dart';
import 'package:juntos_app/app/features/home/home.dart';
import 'package:juntos_app/app/features/login/login.dart';
import 'package:juntos_app/app/features/profile/profile.dart';
import 'package:juntos_app/app/features/purchases/domain/entities/entities.dart';
import 'package:juntos_app/app/features/purchases/purchases.dart';
import 'package:juntos_app/app/features/recovery_password/recovery_password.dart';
import 'package:juntos_app/app/features/registration/registration.dart';
import 'package:juntos_app/app/features/splash/splash.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    initialLocation: Routes.routeSplash.path,
    routes: [
      _getSplashRoutes(),
      _getLoginRoutes(),
      _getAnimationRoutes(),
      _getHomeRoutes(),
    ],
  );

  static GoRoute _getSplashRoutes() {
    return GoRoute(
      name: Routes.routeSplash.name,
      path: Routes.routeSplash.path,
      pageBuilder: (_, state) {
        return CustomSlideTransition(
          key: state.pageKey,
          child: const SplashPage(),
        );
      },
    );
  }

  static GoRoute _getLoginRoutes() {
    return GoRoute(
      name: Routes.routeLogin.name,
      path: Routes.routeLogin.path,
      pageBuilder: (_, state) {
        return CustomSlideTransition(
          key: state.pageKey,
          child: const LoginPage(),
        );
      },
      routes: [
        _getRecoveryPasswordRoutes(),
        _getRegistrationRoutes(),
      ],
    );
  }

  static GoRoute _getRecoveryPasswordRoutes() {
    return GoRoute(
      name: Routes.routeRecoveryPassword.name,
      path: Routes.routeRecoveryPassword.path,
      pageBuilder: (_, state) {
        return CustomSlideTransition(
          key: state.pageKey,
          child: const RecoveryPasswordPage(),
        );
      },
    );
  }

  static GoRoute _getRegistrationRoutes() {
    return GoRoute(
      name: Routes.routeRegistration.name,
      path: Routes.routeRegistration.path,
      pageBuilder: (_, state) {
        return CustomSlideTransition(
          key: state.pageKey,
          child: const RegistrationPage(),
        );
      },
      routes: [
        _getCompleteRegistrationRoutes(),
      ],
    );
  }

  static GoRoute _getCompleteRegistrationRoutes() {
    return GoRoute(
      name: Routes.routeCompleteRegistration.name,
      path: Routes.routeCompleteRegistration.path,
      pageBuilder: (_, state) {
        return CustomSlideTransition(
          key: state.pageKey,
          child: CompleteRegistrationPage(
            account: state.extra! as Account,
          ),
        );
      },
    );
  }

  static GoRoute _getAnimationRoutes() {
    return GoRoute(
      name: Routes.routeAnimation.name,
      path: Routes.routeAnimation.path,
      pageBuilder: (_, state) {
        return CustomSlideTransition(
          key: state.pageKey,
          child: AnimationPage(
            logo: (state.extra! as Map<String, dynamic>)['logo'] != null
                ? (state.extra! as Map<String, dynamic>)['logo'] as String
                : null,
            benefit: (state.extra! as Map<String, dynamic>)['benefit'] != null
                ? (state.extra! as Map<String, dynamic>)['benefit'] as Benefit
                : null,
          ),
        );
      },
    );
  }

  static GoRoute _getHomeRoutes() {
    return GoRoute(
      name: Routes.routeHome.name,
      path: Routes.routeHome.path,
      pageBuilder: (_, state) {
        return CustomSlideTransition(
          key: state.pageKey,
          child: const HomePage(),
        );
      },
      routes: [
        _getProfileRoutes(),
        _getPurchasesRoutes(),
        _getGiveawayDetailRoutes(),
        _getBenefitDetailRoutes(),
      ],
    );
  }

  static GoRoute _getProfileRoutes() {
    return GoRoute(
      name: Routes.routeProfile.name,
      path: Routes.routeProfile.path,
      pageBuilder: (_, state) {
        return CustomSlideTransition(
          key: state.pageKey,
          child: const ProfilePage(),
        );
      },
    );
  }

  static GoRoute _getPurchasesRoutes() {
    return GoRoute(
      name: Routes.routePurchases.name,
      path: Routes.routePurchases.path,
      pageBuilder: (_, state) {
        return CustomSlideTransition(
          key: state.pageKey,
          child: const PurchasesPage(),
        );
      },
      routes: [
        _getPurchaseDetailRoutes(),
      ],
    );
  }

  static GoRoute _getPurchaseDetailRoutes() {
    return GoRoute(
      name: Routes.routePurchaseDetail.name,
      path: Routes.routePurchaseDetail.path,
      pageBuilder: (_, state) {
        return CustomSlideTransition(
          key: state.pageKey,
          child: PurchaseDetailPage(
            purchase: state.extra! as Purchase,
          ),
        );
      },
    );
  }

  static GoRoute _getGiveawayDetailRoutes() {
    return GoRoute(
      name: Routes.routeGiveawayDetail.name,
      path: Routes.routeGiveawayDetail.path,
      pageBuilder: (_, state) {
        return CustomSlideTransition(
          key: state.pageKey,
          child: GiveawayDetailPage(
            giveaway: state.extra! as Giveaway,
          ),
        );
      },
      routes: [
        _getGiveawayInviteRoutes(),
      ],
    );
  }

  static GoRoute _getGiveawayInviteRoutes() {
    return GoRoute(
      name: Routes.routeGiveawayInvite.name,
      path: Routes.routeGiveawayInvite.path,
      pageBuilder: (_, state) {
        return CustomSlideTransition(
          key: state.pageKey,
          child: GiveawayInvitePage(
            giveaway: state.extra! as Giveaway,
          ),
        );
      },
    );
  }

  static GoRoute _getBenefitDetailRoutes() {
    return GoRoute(
      name: Routes.routeBenefitDetail.name,
      path: Routes.routeBenefitDetail.path,
      pageBuilder: (_, state) {
        return CustomSlideTransition(
          key: state.pageKey,
          child: BenefitDetailPage(
            benefit: state.extra! as Benefit,
          ),
        );
      },
    );
  }
}
