part of 'usecases.dart';

class RecoveryPassword {
  RecoveryPassword(this.authRepository);

  final IAuthRepository authRepository;

  Future<Either<Failure, String>> call(String email) async {
    return authRepository.recoveryPassword(email);
  }
}
