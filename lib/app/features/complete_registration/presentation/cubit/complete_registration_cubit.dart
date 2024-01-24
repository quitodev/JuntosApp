import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:juntos_app/app/core/domain/entities/entities.dart';
import 'package:juntos_app/app/core/utils/utils.dart';
import 'package:juntos_app/app/features/complete_registration/domain/usecases/usecases.dart';

part 'complete_registration_state.dart';

class CompleteRegistrationCubit extends Cubit<CompleteRegistrationState> {
  CompleteRegistrationCubit({
    required VerifyEmail verifyEmail,
    required ResendCode resendCode,
  })  : _verifyEmail = verifyEmail,
        _resendCode = resendCode,
        super(
          CompleteRegistrationState(
            status: CompleteRegistrationInitial(),
            verificationCode: '',
          ),
        );

  final VerifyEmail _verifyEmail;
  final ResendCode _resendCode;

  void _showLoading() {
    emit(
      state.copyWith(
        status: CompleteRegistrationLoading(),
      ),
    );
  }

  void _showError(Failure failure) {
    emit(
      state.copyWith(
        status: CompleteRegistrationError(
          failure.message,
        ),
      ),
    );
    emit(
      state.copyWith(
        status: CompleteRegistrationInitial(),
      ),
    );
  }

  void writeVerificationCode(String value) {
    emit(
      state.copyWith(
        verificationCode: value,
      ),
    );
  }

  Future<void> verifyEmail() async {
    _showLoading();
    final either = await _verifyEmail.call(state.verificationCode);
    either.fold(
      (failure) => _showError(failure),
      (_) {
        emit(
          state.copyWith(
            status: CompleteRegistrationSuccess(),
          ),
        );
      },
    );
  }

  Future<void> resendCode(Account account) async {
    _showLoading();
    final either = await _resendCode.call(account);
    either.fold(
      (failure) => _showError(failure),
      (_) {
        emit(
          state.copyWith(
            status: CompleteRegistrationInitial(),
          ),
        );
      },
    );
  }
}
