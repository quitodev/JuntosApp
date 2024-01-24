part of 'datasources.dart';

abstract class IBenefitsDatasource {
  Future<List<CategoryModel>> getCategories();
  Future<List<BenefitModel>> getBenefits();
  Future<String> benefitUsed(String productId);
}

class BenefitsDatasource implements IBenefitsDatasource {
  BenefitsDatasource({
    required this.dio,
  });

  final Dio dio;

  @override
  Future<List<CategoryModel>> getCategories() async {
    if (await AppUtils.userHasInternet()) {
      final response = await dio.get(
        '/category',
      );
      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        return List<CategoryModel>.from(
          (data['rows'] as List).map(CategoryModel.fromJson).toList(),
        );
      }
    }
    throw Exception();
  }

  @override
  Future<List<BenefitModel>> getBenefits() async {
    if (await AppUtils.userHasInternet()) {
      final response = await dio.get(
        '/product',
      );
      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        return List<BenefitModel>.from(
          (data['rows'] as List).map(BenefitModel.fromJson).toList(),
        );
      }
    }
    throw Exception();
  }

  @override
  Future<String> benefitUsed(String productId) async {
    // if (await AppUtils.userHasInternet()) {
    //   final response = await dio.put(
    //     '/xxxxx',
    //     data: {
    //       'productId': productId,
    //     },
    //   );
    //   if (response.statusCode == 200) {
    //     return response.data.toString();
    //   }
    // }
    // throw Exception();
    return '';
  }
}
