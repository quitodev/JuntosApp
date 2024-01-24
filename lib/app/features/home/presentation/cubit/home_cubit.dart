import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:juntos_app/app/core/domain/entities/entities.dart';
import 'package:juntos_app/app/core/domain/usecases/usecases.dart';
import 'package:juntos_app/app/core/utils/utils.dart';
import 'package:juntos_app/app/features/home/domain/entities/entities.dart';
import 'package:juntos_app/app/features/home/domain/usecases/usecases.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required GetUser getUser,
    required GetBanners getBanners,
    required GetWinners getWinners,
  })  : _getUser = getUser,
        _getBanners = getBanners,
        _getWinners = getWinners,
        super(
          HomeState(
            status: HomeLoading(),
            account: Account.empty(),
            banners: List.empty(),
            winner: Winner.empty(),
          ),
        );

  final GetUser _getUser;
  final GetBanners _getBanners;
  final GetWinners _getWinners;

  void _showLoading() {
    emit(
      state.copyWith(
        status: HomeLoading(),
      ),
    );
  }

  void _showError(Failure failure) {
    emit(
      state.copyWith(
        status: HomeError(
          failure.message,
        ),
      ),
    );
  }

  Future<void> getUser() async {
    _showLoading();
    final either = await _getUser.call();
    either.fold(
      (failure) => _showError(failure),
      (result) async {
        emit(
          state.copyWith(
            status: result.emailVerified
                ? HomeInitial()
                : HomeCompleteRegistration(),
            // status: result.status
            //     ? result.emailVerified
            //         ? HomeInitial()
            //         : HomeCompleteRegistration()
            //     : HomeUserSuspended(),
            account: result,
          ),
        );
        if (state.status is HomeInitial) {
          await getBanners();
        }
      },
    );
  }

  Future<void> getBanners() async {
    final either = await _getBanners.call();
    either.fold(
      (failure) => _showError(failure),
      (result) {
        emit(
          state.copyWith(
            banners: result,
          ),
        );
        getWinners();
      },
    );
  }

  Future<void> getWinners() async {
    final either = await _getWinners.call();
    either.fold(
      (failure) => _showError(failure),
      (result) {
        emit(
          state.copyWith(
            winner: result
                .where(
                  (winner) =>
                      winner.publish.isAfter(DateTime.now()) &&
                      winner.publish.isBefore(
                        DateTime.now().add(
                          const Duration(hours: 48),
                        ),
                      ),
                )
                .toList()
                .firstOrNull,
          ),
        );
        emit(
          state.copyWith(
            status:
                state.winner.id.isNotEmpty ? HomeUserWinner() : HomeInitial(),
          ),
        );
      },
    );
  }

  void closeWinner() {
    emit(
      state.copyWith(
        status: HomeInitial(),
      ),
    );
  }
}
