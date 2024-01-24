part of 'datasources.dart';

abstract class IRadioDatasource {
  Future<String> getRadio();
}

class RadioDatasource implements IRadioDatasource {
  RadioDatasource({
    required this.dio,
  });

  final Dio dio;

  @override
  Future<String> getRadio() async {
    if (await AppUtils.userHasInternet()) {
      final response = await dio.get(
        '/xxxxx',
      );
      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        return '$data';
      }
    }
    throw Exception();
  }
}
