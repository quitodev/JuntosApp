import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:juntos_app/app/core/utils/utils.dart';
import 'package:juntos_app/app/features/recovery_password/domain/usecases/usecases.dart';

part 'recovery_password_state.dart';

class RecoveryPasswordCubit extends Cubit<RecoveryPasswordState> {
  RecoveryPasswordCubit({
    required RecoveryPassword recoveryPassword,
  })  : _recoveryPassword = recoveryPassword,
        super(
          RecoveryPasswordState(
            status: RecoveryPasswordInitial(),
            email: '',
          ),
        );

  final RecoveryPassword _recoveryPassword;

  void _showLoading() {
    emit(
      state.copyWith(
        status: RecoveryPasswordLoading(),
      ),
    );
  }

  void _showError(Failure failure) {
    emit(
      state.copyWith(
        status: RecoveryPasswordError(
          failure.message,
        ),
      ),
    );
    emit(
      state.copyWith(
        status: RecoveryPasswordInitial(),
      ),
    );
  }

  void writeEmail(String value) {
    emit(
      state.copyWith(
        email: value,
      ),
    );
  }

  Future<void> recoveryPassword() async {
    _showLoading();
    final either = await _recoveryPassword.call(state.email);
    either.fold(
      (failure) => _showError(failure),
      (_) {
        emit(
          state.copyWith(
            status: RecoveryPasswordSuccess(),
          ),
        );
      },
    );
  }
}
