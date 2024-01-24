import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:juntos_app/app/core/utils/utils.dart';
import 'package:juntos_app/app/features/giveaways/domain/entities/entities.dart';
import 'package:juntos_app/app/features/giveaways/domain/usecases/usecases.dart';

part 'giveaway_invite_state.dart';

class GiveawayInviteCubit extends Cubit<GiveawayInviteState> {
  GiveawayInviteCubit({
    required GiveawayShared giveawayShared,
  })  : _giveawayShared = giveawayShared,
        super(
          GiveawayInviteState(
            status: GiveawayInviteInitial(),
            giveaway: Giveaway.empty(),
          ),
        );

  final GiveawayShared _giveawayShared;

  void _showLoading() {
    emit(
      state.copyWith(
        status: GiveawayInviteLoading(),
      ),
    );
  }

  void _showError(Failure failure) {
    emit(
      state.copyWith(
        status: GiveawayInviteError(
          failure.message,
        ),
      ),
    );
    emit(
      state.copyWith(
        status: GiveawayInviteInitial(),
      ),
    );
  }

  void setGiveaway(Giveaway giveaway) {
    emit(
      state.copyWith(
        giveaway: giveaway,
      ),
    );
  }

  Future<void> giveawayShared() async {
    _showLoading();
    final either = await _giveawayShared.call(state.giveaway.id);
    either.fold(
      (failure) => _showError(failure),
      (_) {
        emit(
          state.copyWith(
            status: GiveawayInviteInitial(),
          ),
        );
      },
    );
  }
}
