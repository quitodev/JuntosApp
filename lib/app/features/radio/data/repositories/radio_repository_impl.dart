part of 'repositories_impl.dart';

class RadioRepositoryImpl implements IRadioRepository {
  RadioRepositoryImpl(this.radioDatasource);

  final IRadioDatasource radioDatasource;

  @override
  Future<Either<Failure, String>> getRadio() async {
    try {
      return Right(
        await radioDatasource.getRadio(),
      );
    } on DioException catch (error) {
      log(
        '$error ${error.response?.data}',
        name: Repositories.repositoryRadio,
      );
      return Left(
        Failure(
          error.response != null && error.response!.statusCode == 400
              ? error.response!.data.toString()
              : Errors.errorNetwork,
        ),
      );
    } catch (error) {
      log(error.toString(), name: Repositories.repositoryRadio);
      return const Left(
        Failure(Errors.errorNetwork),
      );
    }
  }
}
