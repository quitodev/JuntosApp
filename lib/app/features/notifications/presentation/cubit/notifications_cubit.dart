import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:juntos_app/app/core/utils/utils.dart';
import 'package:juntos_app/app/features/notifications/domain/entities/entities.dart';
import 'package:juntos_app/app/features/notifications/domain/usecases/usecases.dart';

part 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit({
    required GetNotifications getNotifications,
  })  : _getNotifications = getNotifications,
        super(
          NotificationsState(
            status: NotificationsInitial(),
            notifications: List.empty(),
          ),
        );

  final GetNotifications _getNotifications;

  void _showLoading() {
    emit(
      state.copyWith(
        status: NotificationsLoading(),
      ),
    );
  }

  void _showError(Failure failure) {
    emit(
      state.copyWith(
        status: NotificationsError(
          failure.message,
        ),
      ),
    );
    emit(
      state.copyWith(
        status: NotificationsInitial(),
      ),
    );
  }

  Future<void> getNotifications() async {
    _showLoading();
    final either = await _getNotifications.call();
    either.fold(
      (failure) => _showError(failure),
      (result) {
        emit(
          state.copyWith(
            status: result.isNotEmpty
                ? NotificationsSuccess()
                : NotificationsEmpty(),
            notifications: result,
          ),
        );
      },
    );
  }
}
