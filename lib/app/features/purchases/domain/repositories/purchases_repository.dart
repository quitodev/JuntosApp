part of 'repositories.dart';

abstract class IPurchasesRepository {
  Future<Either<Failure, List<Purchase>>> getPurchases();
}
