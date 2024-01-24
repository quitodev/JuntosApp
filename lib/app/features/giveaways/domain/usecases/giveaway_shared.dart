part of 'usecases.dart';

class GiveawayShared {
  GiveawayShared(this.giveawaysRepository);

  final IGiveawaysRepository giveawaysRepository;

  Future<Either<Failure, String>> call(String giveawayId) async {
    return giveawaysRepository.giveawayShared(giveawayId);
  }
}
