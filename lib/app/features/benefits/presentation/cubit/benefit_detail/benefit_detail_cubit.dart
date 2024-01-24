import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:juntos_app/app/core/utils/utils.dart';
import 'package:juntos_app/app/features/benefits/domain/usecases/usecases.dart';

part 'benefit_detail_state.dart';

class BenefitDetailCubit extends Cubit<BenefitDetailState> {
  BenefitDetailCubit({
    required BenefitUsed benefitUsed,
  })  : _benefitUsed = benefitUsed,
        super(
          BenefitDetailState(
            status: BenefitDetailInitial(),
          ),
        );

  final BenefitUsed _benefitUsed;

  void _showLoading() {
    emit(
      state.copyWith(
        status: BenefitDetailLoading(),
      ),
    );
  }

  void _showError(Failure failure) {
    emit(
      state.copyWith(
        status: BenefitDetailError(
          failure.message,
        ),
      ),
    );
    emit(
      state.copyWith(
        status: BenefitDetailInitial(),
      ),
    );
  }

  Future<void> benefitUsed(String productId) async {
    _showLoading();
    final either = await _benefitUsed.call(productId);
    either.fold(
      (failure) => _showError(failure),
      (_) {
        emit(
          state.copyWith(
            status: BenefitDetailSuccess(),
          ),
        );
      },
    );
  }
}
