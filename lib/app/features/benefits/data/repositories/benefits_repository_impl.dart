part of 'repositories_impl.dart';

class BenefitsRepositoryImpl implements IBenefitsRepository {
  BenefitsRepositoryImpl(this.benefitsDatasource);

  final IBenefitsDatasource benefitsDatasource;

  @override
  Future<Either<Failure, List<Category>>> getCategories() async {
    try {
      return Right(
        await benefitsDatasource.getCategories(),
      );
    } on DioException catch (error) {
      log(
        '$error ${error.response?.data}',
        name: Repositories.repositoryBenefits,
      );
      return Left(
        Failure(
          error.response != null && error.response!.statusCode == 400
              ? error.response!.data.toString()
              : Errors.errorNetwork,
        ),
      );
    } catch (error) {
      log(error.toString(), name: Repositories.repositoryBenefits);
      return const Left(
        Failure(Errors.errorNetwork),
      );
    }
  }

  @override
  Future<Either<Failure, List<Benefit>>> getBenefits() async {
    try {
      return Right(
        await benefitsDatasource.getBenefits(),
      );
    } on DioException catch (error) {
      log(
        '$error ${error.response?.data}',
        name: Repositories.repositoryBenefits,
      );
      return Left(
        Failure(
          error.response != null && error.response!.statusCode == 400
              ? error.response!.data.toString()
              : Errors.errorNetwork,
        ),
      );
    } catch (error) {
      log(error.toString(), name: Repositories.repositoryBenefits);
      return const Left(
        Failure(Errors.errorNetwork),
      );
    }
  }

  @override
  Future<Either<Failure, String>> benefitUsed(String productId) async {
    try {
      return Right(
        await benefitsDatasource.benefitUsed(productId),
      );
    } on DioException catch (error) {
      log(
        '$error ${error.response?.data}',
        name: Repositories.repositoryBenefits,
      );
      return Left(
        Failure(
          error.response != null && error.response!.statusCode == 400
              ? error.response!.data.toString()
              : Errors.errorNetwork,
        ),
      );
    } catch (error) {
      log(error.toString(), name: Repositories.repositoryBenefits);
      return const Left(
        Failure(Errors.errorNetwork),
      );
    }
  }
}
