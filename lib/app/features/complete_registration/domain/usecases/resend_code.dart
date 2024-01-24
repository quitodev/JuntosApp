part of 'usecases.dart';

class ResendCode {
  ResendCode(this.authRepository);

  final IAuthRepository authRepository;

  Future<Either<Failure, String>> call(Account account) async {
    return authRepository.signUp(account);
  }
}
