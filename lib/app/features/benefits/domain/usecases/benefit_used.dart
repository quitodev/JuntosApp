part of 'usecases.dart';

class BenefitUsed {
  BenefitUsed(this.benefitsRepository);

  final IBenefitsRepository benefitsRepository;

  Future<Either<Failure, String>> call(String productId) async {
    return benefitsRepository.benefitUsed(productId);
  }
}
