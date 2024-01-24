part of 'repositories.dart';

abstract class IBenefitsRepository {
  Future<Either<Failure, List<Category>>> getCategories();
  Future<Either<Failure, List<Benefit>>> getBenefits();
  Future<Either<Failure, String>> benefitUsed(String productId);
}
