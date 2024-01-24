part of 'usecases.dart';

class GetBenefits {
  GetBenefits(this.benefitsRepository);

  final IBenefitsRepository benefitsRepository;

  Future<Either<Failure, List<Benefit>>> call() async {
    return benefitsRepository.getBenefits();
  }
}
