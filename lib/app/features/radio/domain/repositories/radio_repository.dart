part of 'repositories.dart';

abstract class IRadioRepository {
  Future<Either<Failure, String>> getRadio();
}
