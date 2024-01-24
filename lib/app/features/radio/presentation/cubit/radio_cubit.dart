import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:juntos_app/app/core/utils/utils.dart';
import 'package:juntos_app/app/features/radio/domain/usecases/usecases.dart';

part 'radio_state.dart';

class RadioCubit extends Cubit<RadioState> {
  RadioCubit({
    required GetRadio getRadio,
  })  : _getRadio = getRadio,
        super(
          RadioState(
            status: RadioInitial(),
          ),
        );

  final GetRadio _getRadio;

  void _showLoading() {
    emit(
      state.copyWith(
        status: RadioLoading(),
      ),
    );
  }

  void _showError(Failure failure) {
    emit(
      state.copyWith(
        status: RadioError(
          failure.message,
        ),
      ),
    );
    emit(
      state.copyWith(
        status: RadioInitial(),
      ),
    );
  }

  Future<void> getRadio() async {
    _showLoading();
    final either = await _getRadio.call();
    either.fold(
      (failure) => _showError(failure),
      (_) {
        emit(
          state.copyWith(
            status: RadioSuccess(),
          ),
        );
      },
    );
  }
}
