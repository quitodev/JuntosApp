import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:juntos_app/app/core/utils/utils.dart';
import 'package:juntos_app/app/features/giveaways/domain/entities/entities.dart';
import 'package:juntos_app/app/features/giveaways/domain/usecases/usecases.dart';

part 'giveaways_state.dart';

class GiveawaysCubit extends Cubit<GiveawaysState> {
  GiveawaysCubit({
    required GetGiveaways getGiveaways,
  })  : _getGiveaways = getGiveaways,
        super(
          GiveawaysState(
            status: GiveawaysInitial(),
            giveaways: List.empty(),
          ),
        );

  final GetGiveaways _getGiveaways;

  void _showLoading() {
    emit(
      state.copyWith(
        status: GiveawaysLoading(),
      ),
    );
  }

  void _showError(Failure failure) {
    emit(
      state.copyWith(
        status: GiveawaysError(
          failure.message,
        ),
      ),
    );
    emit(
      state.copyWith(
        status: GiveawaysInitial(),
      ),
    );
  }

  Future<void> getGiveaways() async {
    _showLoading();
    final either = await _getGiveaways.call();
    either.fold(
      (failure) => _showError(failure),
      (result) {
        emit(
          state.copyWith(
            status: result.isNotEmpty ? GiveawaysSuccess() : GiveawaysEmpty(),
            giveaways: result,
          ),
        );
      },
    );
  }
}
