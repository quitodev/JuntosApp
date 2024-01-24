part of 'datasources.dart';

abstract class IHomeDatasource {
  Future<List<BannerModel>> getBanners();
  Future<List<WinnerModel>> getWinners();
}

class HomeDatasource implements IHomeDatasource {
  HomeDatasource({
    required this.dio,
  });

  final Dio dio;

  @override
  Future<List<BannerModel>> getBanners() async {
    if (await AppUtils.userHasInternet()) {
      final response = await dio.get(
        '/banner-advertising',
      );
      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        return List<BannerModel>.from(
          (data['rows'] as List).map(BannerModel.fromJson).toList(),
        );
      }
    }
    throw Exception();
  }

  @override
  Future<List<WinnerModel>> getWinners() async {
    if (await AppUtils.userHasInternet()) {
      final response = await dio.get(
        '/winner',
      );
      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        return List<WinnerModel>.from(
          (data['rows'] as List).map(WinnerModel.fromJson).toList(),
        );
      }
    }
    throw Exception();
  }
}
