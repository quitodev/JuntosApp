part of 'repositories_impl.dart';

class PurchasesRepositoryImpl implements IPurchasesRepository {
  PurchasesRepositoryImpl(this.purchasesDatasource);

  final IPurchasesDatasource purchasesDatasource;

  @override
  Future<Either<Failure, List<Purchase>>> getPurchases() async {
    try {
      return Right(
        await purchasesDatasource.getPurchases(),
      );
    } on DioException catch (error) {
      log(
        '$error ${error.response?.data}',
        name: Repositories.repositoryPurchases,
      );
      return Left(
        Failure(
          error.response != null && error.response!.statusCode == 400
              ? error.response!.data.toString()
              : Errors.errorNetwork,
        ),
      );
    } catch (error) {
      log(error.toString(), name: Repositories.repositoryPurchases);
      return const Left(
        Failure(Errors.errorNetwork),
      );
    }
  }
}
