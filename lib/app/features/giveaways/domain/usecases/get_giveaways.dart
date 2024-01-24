part of 'usecases.dart';

class GetGiveaways {
  GetGiveaways(this.giveawaysRepository);

  final IGiveawaysRepository giveawaysRepository;

  Future<Either<Failure, List<Giveaway>>> call() async {
    return giveawaysRepository.getGiveaways();
  }
}
