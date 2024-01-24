part of 'repositories_impl.dart';

class UserRepositoryImpl implements IUserRepository {
  UserRepositoryImpl(this.userDatasource);

  final IUserDatasource userDatasource;

  @override
  Future<Either<Failure, Account>> getUser() async {
    try {
      final result = await userDatasource.getUser();
      return Right(result.toEntity());
    } on DioException catch (error) {
      log('$error ${error.response?.data}', name: Repositories.repositoryUser);
      return Left(
        Failure(
          error.response != null && error.response!.statusCode == 400
              ? error.response!.data.toString()
              : Errors.errorNetwork,
        ),
      );
    } catch (error) {
      log(error.toString(), name: Repositories.repositoryUser);
      return const Left(
        Failure(Errors.errorNetwork),
      );
    }
  }

  @override
  Future<Either<Failure, String>> updateUser(Account account) async {
    try {
      return Right(
        await userDatasource.updateUser(
          AccountModel.fromEntity(account),
        ),
      );
    } on DioException catch (error) {
      log('$error ${error.response?.data}', name: Repositories.repositoryUser);
      return Left(
        Failure(
          error.response != null && error.response!.statusCode == 400
              ? error.response!.data.toString()
              : Errors.errorNetwork,
        ),
      );
    } catch (error) {
      log(error.toString(), name: Repositories.repositoryUser);
      return const Left(
        Failure(Errors.errorNetwork),
      );
    }
  }

  @override
  Future<Either<Failure, String>> uploadAvatar(Avatar avatar) async {
    try {
      return Right(
        await userDatasource.uploadAvatar(
          AvatarModel.fromEntity(avatar),
        ),
      );
    } on DioException catch (error) {
      log('$error ${error.response?.data}', name: Repositories.repositoryUser);
      return Left(
        Failure(
          error.response != null && error.response!.statusCode == 400
              ? error.response!.data.toString()
              : Errors.errorNetwork,
        ),
      );
    } catch (error) {
      log(error.toString(), name: Repositories.repositoryUser);
      return const Left(
        Failure(Errors.errorNetwork),
      );
    }
  }

  @override
  Future<Either<Failure, Document>> findDocument(String numberDocument) async {
    try {
      final result = await userDatasource.findDocument(numberDocument);
      return Right(result.toEntity());
    } on DioException catch (error) {
      log('$error ${error.response?.data}', name: Repositories.repositoryUser);
      return Left(
        Failure(
          error.response != null && error.response!.statusCode == 400
              ? error.response!.data.toString()
              : Errors.errorNetwork,
        ),
      );
    } catch (error) {
      log(error.toString(), name: Repositories.repositoryUser);
      return const Left(
        Failure(Errors.errorNetwork),
      );
    }
  }

  @override
  Future<Either<Failure, List<Department>>> getDepartments() async {
    try {
      return Right(
        await userDatasource.getDepartments(),
      );
    } on DioException catch (error) {
      log('$error ${error.response?.data}', name: Repositories.repositoryUser);
      return Left(
        Failure(
          error.response != null && error.response!.statusCode == 400
              ? error.response!.data.toString()
              : Errors.errorNetwork,
        ),
      );
    } catch (error) {
      log(error.toString(), name: Repositories.repositoryUser);
      return const Left(
        Failure(Errors.errorNetwork),
      );
    }
  }

  @override
  Future<Either<Failure, List<Province>>> getProvinces(
    String numberDocument,
  ) async {
    try {
      return Right(
        await userDatasource.getProvinces(numberDocument),
      );
    } on DioException catch (error) {
      log('$error ${error.response?.data}', name: Repositories.repositoryUser);
      return Left(
        Failure(
          error.response != null && error.response!.statusCode == 400
              ? error.response!.data.toString()
              : Errors.errorNetwork,
        ),
      );
    } catch (error) {
      log(error.toString(), name: Repositories.repositoryUser);
      return const Left(
        Failure(Errors.errorNetwork),
      );
    }
  }

  @override
  Future<Either<Failure, List<Institution>>> getInstitutions() async {
    try {
      return Right(
        await userDatasource.getInstitutions(),
      );
    } on DioException catch (error) {
      log('$error ${error.response?.data}', name: Repositories.repositoryUser);
      return Left(
        Failure(
          error.response != null && error.response!.statusCode == 400
              ? error.response!.data.toString()
              : Errors.errorNetwork,
        ),
      );
    } catch (error) {
      log(error.toString(), name: Repositories.repositoryUser);
      return const Left(
        Failure(Errors.errorNetwork),
      );
    }
  }
}
