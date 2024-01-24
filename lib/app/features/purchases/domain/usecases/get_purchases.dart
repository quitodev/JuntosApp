part of 'usecases.dart';

class GetPurchases {
  GetPurchases(this.purchasesRepository);

  final IPurchasesRepository purchasesRepository;

  Future<Either<Failure, List<Purchase>>> call() async {
    return purchasesRepository.getPurchases();
  }
}
