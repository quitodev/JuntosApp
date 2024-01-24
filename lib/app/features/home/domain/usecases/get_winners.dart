part of 'usecases.dart';

class GetWinners {
  GetWinners(this.homeRepository);

  final IHomeRepository homeRepository;

  Future<Either<Failure, List<Winner>>> call() async {
    return homeRepository.getWinners();
  }
}
