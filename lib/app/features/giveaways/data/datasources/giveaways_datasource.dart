part of 'datasources.dart';

abstract class IGiveawaysDatasource {
  Future<List<GiveawayModel>> getGiveaways();
  Future<String> giveawayShared(String giveawayId);
}

class GiveawaysDatasource implements IGiveawaysDatasource {
  GiveawaysDatasource({
    required this.dio,
  });

  final Dio dio;

  @override
  Future<List<GiveawayModel>> getGiveaways() async {
    if (await AppUtils.userHasInternet()) {
      final response = await dio.get(
        '/raffle',
      );
      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        return List<GiveawayModel>.from(
          (data['rows'] as List).map(GiveawayModel.fromJson).toList(),
        );
      }
    }
    throw Exception();
  }

  @override
  Future<String> giveawayShared(String giveawayId) async {
    if (await AppUtils.userHasInternet()) {
      final response = await dio.post(
        '/raffle/share-friends',
        data: {
          'raffleId': giveawayId,
        },
      );
      if (response.statusCode == 200) {
        return response.data.toString();
      }
    }
    throw Exception();
  }
}
