part of 'repositories_impl.dart';

class AuthRepositoryImpl implements IAuthRepository {
  AuthRepositoryImpl(this.authDatasource);

  final IAuthDatasource authDatasource;

  @override
  Future<Either<Failure, String>> signIn(String email, String password) async {
    try {
      return Right(
        await authDatasource.signIn(email, password),
      );
    } on DioException catch (error) {
      log('$error ${error.response?.data}', name: Repositories.repositoryAuth);
      return Left(
        Failure(
          error.response != null && error.response!.statusCode == 400
              ? error.response!.data.toString()
              : Errors.errorNetwork,
        ),
      );
    } catch (error) {
      log(error.toString(), name: Repositories.repositoryAuth);
      return const Left(
        Failure(Errors.errorNetwork),
      );
    }
  }

  @override
  Future<Either<Failure, String>> signUp(Account account) async {
    try {
      return Right(
        await authDatasource.signUp(
          AccountModel.fromEntity(account),
        ),
      );
    } on DioException catch (error) {
      log('$error ${error.response?.data}', name: Repositories.repositoryAuth);
      return Left(
        Failure(
          error.response != null && error.response!.statusCode == 400
              ? error.response!.data.toString()
              : Errors.errorNetwork,
        ),
      );
    } catch (error) {
      log(error.toString(), name: Repositories.repositoryAuth);
      return const Left(
        Failure(Errors.errorNetwork),
      );
    }
  }

  @override
  Future<Either<Failure, String>> recoveryPassword(String email) async {
    try {
      return Right(
        await authDatasource.recoveryPassword(email),
      );
    } on DioException catch (error) {
      log('$error ${error.response?.data}', name: Repositories.repositoryAuth);
      return Left(
        Failure(
          error.response != null && error.response!.statusCode == 400
              ? error.response!.data.toString()
              : Errors.errorNetwork,
        ),
      );
    } catch (error) {
      log(error.toString(), name: Repositories.repositoryAuth);
      return const Left(
        Failure(Errors.errorNetwork),
      );
    }
  }

  @override
  Future<Either<Failure, String>> verifyEmail(String code) async {
    try {
      return Right(
        await authDatasource.verifyEmail(code),
      );
    } on DioException catch (error) {
      log('$error ${error.response?.data}', name: Repositories.repositoryAuth);
      return Left(
        Failure(
          error.response != null && error.response!.statusCode == 400
              ? error.response!.data.toString()
              : Errors.errorNetwork,
        ),
      );
    } catch (error) {
      log(error.toString(), name: Repositories.repositoryAuth);
      return const Left(
        Failure(Errors.errorNetwork),
      );
    }
  }
}
