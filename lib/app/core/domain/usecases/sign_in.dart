part of 'usecases.dart';

class SignIn {
  SignIn(this.authRepository);

  final IAuthRepository authRepository;

  Future<Either<Failure, String>> call(String email, String password) async {
    return authRepository.signIn(email, password);
  }
}
