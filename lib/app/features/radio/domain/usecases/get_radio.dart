part of 'usecases.dart';

class GetRadio {
  GetRadio(this.radioRepository);

  final IRadioRepository radioRepository;

  Future<Either<Failure, String>> call() async {
    return radioRepository.getRadio();
  }
}
