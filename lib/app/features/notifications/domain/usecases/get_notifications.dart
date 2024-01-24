part of 'usecases.dart';

class GetNotifications {
  GetNotifications(this.notificationsRepository);

  final INotificationsRepository notificationsRepository;

  Future<Either<Failure, List<Notification>>> call() async {
    return notificationsRepository.getNotifications();
  }
}
