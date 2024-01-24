part of 'repositories.dart';

abstract class INotificationsRepository {
  Future<Either<Failure, List<Notification>>> getNotifications();
}
