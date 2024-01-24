part of 'repositories_impl.dart';

class GiveawaysRepositoryImpl implements IGiveawaysRepository {
  GiveawaysRepositoryImpl(this.giveawaysDatasource);

  final IGiveawaysDatasource giveawaysDatasource;

  @override
  Future<Either<Failure, List<Giveaway>>> getGiveaways() async {
    try {
      return Right(
        await giveawaysDatasource.getGiveaways(),
      );
    } on DioException catch (error) {
      log(
        '$error ${error.response?.data}',
        name: Repositories.repositoryGiveaways,
      );
      return Left(
        Failure(
          error.response != null && error.response!.statusCode == 400
              ? error.response!.data.toString()
              : Errors.errorNetwork,
        ),
      );
    } catch (error) {
      log(error.toString(), name: Repositories.repositoryGiveaways);
      return const Left(
        Failure(Errors.errorNetwork),
      );
    }
  }

  @override
  Future<Either<Failure, String>> giveawayShared(String giveawayId) async {
    try {
      return Right(
        await giveawaysDatasource.giveawayShared(giveawayId),
      );
    } on DioException catch (error) {
      log(
        '$error ${error.response?.data}',
        name: Repositories.repositoryGiveaways,
      );
      return Left(
        Failure(
          error.response != null && error.response!.statusCode == 400
              ? error.response!.data.toString()
              : Errors.errorNetwork,
        ),
      );
    } catch (error) {
      log(error.toString(), name: Repositories.repositoryGiveaways);
      return const Left(
        Failure(Errors.errorNetwork),
      );
    }
  }
}
