part of 'repositories.dart';

abstract class IAuthRepository {
  Future<Either<Failure, String>> signIn(String email, String password);
  Future<Either<Failure, String>> signUp(Account account);
  Future<Either<Failure, String>> recoveryPassword(String email);
  Future<Either<Failure, String>> verifyEmail(String code);
}
