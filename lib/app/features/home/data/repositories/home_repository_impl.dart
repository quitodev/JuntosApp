part of 'repositories_impl.dart';

class HomeRepositoryImpl implements IHomeRepository {
  HomeRepositoryImpl(this.homeDatasource);

  final IHomeDatasource homeDatasource;

  @override
  Future<Either<Failure, List<Banner>>> getBanners() async {
    try {
      return Right(
        await homeDatasource.getBanners(),
      );
    } on DioException catch (error) {
      log('$error ${error.response?.data}', name: Repositories.repositoryHome);
      return Left(
        Failure(
          error.response != null && error.response!.statusCode == 400
              ? error.response!.data.toString()
              : Errors.errorNetwork,
        ),
      );
    } catch (error) {
      log(error.toString(), name: Repositories.repositoryHome);
      return const Left(
        Failure(Errors.errorNetwork),
      );
    }
  }

  @override
  Future<Either<Failure, List<Winner>>> getWinners() async {
    try {
      return Right(
        await homeDatasource.getWinners(),
      );
    } on DioException catch (error) {
      log('$error ${error.response?.data}', name: Repositories.repositoryHome);
      return Left(
        Failure(
          error.response != null && error.response!.statusCode == 400
              ? error.response!.data.toString()
              : Errors.errorNetwork,
        ),
      );
    } catch (error) {
      log(error.toString(), name: Repositories.repositoryHome);
      return const Left(
        Failure(Errors.errorNetwork),
      );
    }
  }
}
