part of 'datasources.dart';

abstract class IAuthDatasource {
  Future<String> signIn(String email, String password);
  Future<String> signUp(AccountModel account);
  Future<String> recoveryPassword(String email);
  Future<String> verifyEmail(String code);
}

class AuthDatasource implements IAuthDatasource {
  AuthDatasource({
    required this.dio,
  });

  final Dio dio;

  @override
  Future<String> signIn(String email, String password) async {
    if (await AppUtils.userHasInternet()) {
      final response = await dio.post(
        '/auth/sign-in',
        data: {
          'email': email,
          'password': password,
        },
      );
      if (response.statusCode == 200) {
        dio.options.headers['Authorization'] = 'Bearer ${response.data}';
        return response.data.toString();
      }
    }
    throw Exception();
  }

  @override
  Future<String> signUp(AccountModel account) async {
    if (await AppUtils.userHasInternet()) {
      final response = await dio.post(
        '/auth/sign-up',
        data: account.toJsonRegistration(),
      );
      if (response.statusCode == 200) {
        return response.data.toString();
      }
    }
    throw Exception();
  }

  @override
  Future<String> recoveryPassword(String email) async {
    if (await AppUtils.userHasInternet()) {
      final response = await dio.post(
        '/auth/send-password-reset-email',
        data: {
          'email': email,
        },
      );
      if (response.statusCode == 200) {
        return response.data.toString();
      }
    }
    throw Exception();
  }

  @override
  Future<String> verifyEmail(String code) async {
    if (await AppUtils.userHasInternet()) {
      final response = await dio.put(
        '/auth/verify-email',
        data: {
          'token': code,
        },
      );
      if (response.statusCode == 200) {
        return response.data.toString();
      }
    }
    throw Exception();
  }
}
