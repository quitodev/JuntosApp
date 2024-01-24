part of 'utils.dart';

class Api {
  static const String baseUrl = 'http://api.juntosapp.pe';
}

class Configs {
  static const String configUrlImages = 'https://static.juntosapp.pe/';
  static const String configHelp = 'https://www.juntosapp.pe/#faqs';
  static const String configTerms = 'https://www.juntosapp.pe/terminos/';
  static const String configPolicies = 'https://www.juntosapp.pe/politicas/';
  static const String configUrlApp =
      'https://play.google.com/store/apps/details?id=com.juntos.app.juntos_app';
  static const List<String> configCarnet = [
    'DNI',
    'CARNET DE EXTRANJERÍA',
  ];
  static const List<String> configHomeNav = [
    'BOARD',
    'SORTEOS',
    'BENEFICIOS',
    'NOTIFICACIONES',
    'RADIO JUNTOS',
  ];
}

class Errors {
  static const String errorData =
      'Hubo un error, por favor revisa los datos ingresados';
  static const String errorAdmin =
      'Hubo un error, por favor contacte al administrador';
  static const String errorNetwork =
      'Hubo un error, por favor revisa tu conexión e intenta nuevamente';
}

class Repositories {
  static const String repositoryAuth = 'Auth Repository';
  static const String repositoryUser = 'User Repository';
  static const String repositoryHome = 'Home Repository';
  static const String repositoryBoard = 'Board Repository';
  static const String repositoryGiveaways = 'Giveaways Repository';
  static const String repositoryBenefits = 'Benefits Repository';
  static const String repositoryNotifications = 'Notifications Repository';
  static const String repositoryPurchases = 'Purchases Repository';
  static const String repositoryRadio = 'Radio Repository';
}

class Routes {
  static final RouteData routeSplash = RouteData(
    'splash',
    '/',
  );
  static final RouteData routeLogin = RouteData(
    'login',
    '/login',
  );
  static final RouteData routeRecoveryPassword = RouteData(
    'recovery_password',
    'recovery_password',
  );
  static final RouteData routeRegistration = RouteData(
    'registration',
    'registration',
  );
  static final RouteData routeCompleteRegistration = RouteData(
    'complete_registration',
    'complete_registration',
  );
  static final RouteData routeAnimation = RouteData(
    'animation',
    '/animation',
  );
  static final RouteData routeHome = RouteData(
    'home',
    '/home',
  );
  static final RouteData routeProfile = RouteData(
    'profile',
    'profile',
  );
  static final RouteData routeGiveawayDetail = RouteData(
    'giveaway_detail',
    'giveaway_detail',
  );
  static final RouteData routeGiveawayInvite = RouteData(
    'giveaway_invite',
    'giveaway_invite',
  );
  static final RouteData routePurchases = RouteData(
    'purchases',
    'purchases',
  );
  static final RouteData routePurchaseDetail = RouteData(
    'purchase_detail',
    'purchase_detail',
  );
  static final RouteData routeBenefitDetail = RouteData(
    'benefit_detail',
    'benefit_detail',
  );
}

class RouteData {
  RouteData(this.name, this.path);

  final String name;
  final String path;
}

class AppImages {
  static const String background = 'assets/images/background.jpg';
  static const String splash = 'assets/images/splash.jpg';
  static const String login = 'assets/images/login.jpg';
  static const String animation = 'assets/images/animation.png';
  static const String appLogo = 'assets/images/app_logo.png';
  static const String appIcon = 'assets/images/app_icon.png';
  static const String radio = 'assets/images/radio.jpg';
}

class AppSvg {
  static const String account = 'assets/svg/account.svg';
  static const String arrowNext = 'assets/svg/arrow_next.svg';
  static const String email = 'assets/svg/email.svg';
  static const String eyeHide = 'assets/svg/eye_hide.svg';
  static const String eyeShow = 'assets/svg/eye_show.svg';
  static const String carnet = 'assets/svg/carnet.svg';
  static const String man = 'assets/svg/man.svg';
  static const String woman = 'assets/svg/woman.svg';
  static const String pin = 'assets/svg/pin.svg';
  static const String map = 'assets/svg/map.svg';
  static const String phone = 'assets/svg/phone.svg';
  static const String institution = 'assets/svg/institution.svg';
  static const String board = 'assets/svg/board.svg';
  static const String giveaways = 'assets/svg/giveaways.svg';
  static const String benefits = 'assets/svg/benefits.svg';
  static const String bell = 'assets/svg/bell.svg';
  static const String play = 'assets/svg/play.svg';
  static const String stop = 'assets/svg/stop.svg';
  static const String camera = 'assets/svg/change_camera.svg';
  static const String share = 'assets/svg/share.svg';
  static const String thumbUp = 'assets/svg/thumb_up.svg';
  static const String thumbDown = 'assets/svg/thumb_down.svg';
  static const String timeLeft = 'assets/svg/time_left.svg';
  static const String edit = 'assets/svg/edit.svg';
  static const String friends = 'assets/svg/friends.svg';
  static const String pdf = 'assets/svg/pdf.svg';
  static const String restaurant = 'assets/svg/restaurant.svg';
  static const String stock = 'assets/svg/stock.svg';
  static const String one = 'assets/svg/one.svg';
  static const String two = 'assets/svg/two.svg';
  static const String three = 'assets/svg/three.svg';
  static const String exit = 'assets/svg/exit.svg';
}
