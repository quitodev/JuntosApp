part of 'repositories.dart';

abstract class IHomeRepository {
  Future<Either<Failure, List<Banner>>> getBanners();
  Future<Either<Failure, List<Winner>>> getWinners();
}
