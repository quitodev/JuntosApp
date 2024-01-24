part of 'notifications_cubit.dart';

class NotificationsState extends Equatable {
  const NotificationsState({
    required this.status,
    required this.notifications,
  });

  final NotificationsStatus status;
  final List<Notification> notifications;

  NotificationsState copyWith({
    NotificationsStatus? status,
    List<Notification>? notifications,
  }) {
    return NotificationsState(
      status: status ?? this.status,
      notifications: notifications ?? this.notifications,
    );
  }

  @override
  List<Object> get props => [
        status,
        notifications,
      ];
}

abstract class NotificationsStatus {}

class NotificationsInitial extends NotificationsStatus {}

class NotificationsLoading extends NotificationsStatus {}

class NotificationsSuccess extends NotificationsStatus {}

class NotificationsEmpty extends NotificationsStatus {}

class NotificationsError extends NotificationsStatus {
  NotificationsError(this.text);

  final String text;
}
