part of 'usecases.dart';

class GetCategories {
  GetCategories(this.benefitsRepository);

  final IBenefitsRepository benefitsRepository;

  Future<Either<Failure, List<Category>>> call() async {
    return benefitsRepository.getCategories();
  }
}
