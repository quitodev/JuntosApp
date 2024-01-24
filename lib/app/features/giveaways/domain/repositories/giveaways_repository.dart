part of 'repositories.dart';

abstract class IGiveawaysRepository {
  Future<Either<Failure, List<Giveaway>>> getGiveaways();
  Future<Either<Failure, String>> giveawayShared(String giveawayId);
}
