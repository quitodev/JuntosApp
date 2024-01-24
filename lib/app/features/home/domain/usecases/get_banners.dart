part of 'usecases.dart';

class GetBanners {
  GetBanners(this.homeRepository);

  final IHomeRepository homeRepository;

  Future<Either<Failure, List<Banner>>> call() async {
    return homeRepository.getBanners();
  }
}
