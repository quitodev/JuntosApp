part of 'usecases.dart';

class VerifyEmail {
  VerifyEmail(this.authRepository);

  final IAuthRepository authRepository;

  Future<Either<Failure, String>> call(String code) async {
    return authRepository.verifyEmail(code);
  }
}
