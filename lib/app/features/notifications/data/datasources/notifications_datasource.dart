part of 'datasources.dart';

abstract class INotificationsDatasource {
  Future<List<NotificationModel>> getNotifications();
}

class NotificationsDatasource implements INotificationsDatasource {
  NotificationsDatasource({
    required this.dio,
  });

  final Dio dio;

  @override
  Future<List<NotificationModel>> getNotifications() async {
    if (await AppUtils.userHasInternet()) {
      final response = await dio.get(
        '/notification',
      );
      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        return List<NotificationModel>.from(
          (data['rows'] as List).map(NotificationModel.fromJson).toList(),
        );
      }
    }
    throw Exception();
  }
}
