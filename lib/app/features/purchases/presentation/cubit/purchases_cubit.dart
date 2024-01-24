import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:juntos_app/app/core/utils/utils.dart';
import 'package:juntos_app/app/features/purchases/domain/entities/entities.dart';
import 'package:juntos_app/app/features/purchases/domain/usecases/usecases.dart';

part 'purchases_state.dart';

class PurchasesCubit extends Cubit<PurchasesState> {
  PurchasesCubit({
    required GetPurchases getPurchases,
  })  : _getPurchases = getPurchases,
        super(
          PurchasesState(
            status: PurchasesInitial(),
            purchases: List.empty(),
          ),
        );

  final GetPurchases _getPurchases;

  void _showLoading() {
    emit(
      state.copyWith(
        status: PurchasesLoading(),
      ),
    );
  }

  void _showError(Failure failure) {
    emit(
      state.copyWith(
        status: PurchasesError(
          failure.message,
        ),
      ),
    );
    emit(
      state.copyWith(
        status: PurchasesInitial(),
      ),
    );
  }

  Future<void> getPurchases() async {
    _showLoading();
    final either = await _getPurchases.call();
    either.fold(
      (failure) => _showError(failure),
      (result) {
        emit(
          state.copyWith(
            status: result.isNotEmpty ? PurchasesSuccess() : PurchasesEmpty(),
            purchases: result,
          ),
        );
      },
    );
  }
}
