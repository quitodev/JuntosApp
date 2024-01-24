part of 'datasources.dart';

abstract class IPurchasesDatasource {
  Future<List<PurchaseModel>> getPurchases();
}

class PurchasesDatasource implements IPurchasesDatasource {
  PurchasesDatasource({
    required this.dio,
  });

  final Dio dio;

  @override
  Future<List<PurchaseModel>> getPurchases() async {
    if (await AppUtils.userHasInternet()) {
      final response = await dio.get(
        '/product/buy',
      );
      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        return List<PurchaseModel>.from(
          (data['rows'] as List).map(PurchaseModel.fromJson).toList(),
        );
      }
    }
    throw Exception();
  }
}
