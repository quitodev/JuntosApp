part of 'usecases.dart';

class SignUp {
  SignUp(this.authRepository);

  final IAuthRepository authRepository;

  Future<Either<Failure, String>> call(Account account) async {
    return authRepository.signUp(account);
  }
}
