import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:juntos_app/app/core/utils/utils.dart';
import 'package:juntos_app/app/features/benefits/domain/entities/entities.dart';
import 'package:juntos_app/app/features/benefits/domain/usecases/usecases.dart';

part 'benefits_state.dart';

class BenefitsCubit extends Cubit<BenefitsState> {
  BenefitsCubit({
    required GetCategories getCategories,
    required GetBenefits getBenefits,
  })  : _getCategories = getCategories,
        _getBenefits = getBenefits,
        super(
          BenefitsState(
            status: BenefitsInitial(),
            categories: List.empty(),
            benefits: List.empty(),
            benefitsFiltered: List.empty(),
            categorySelected: Category.empty(),
          ),
        );

  final GetCategories _getCategories;
  final GetBenefits _getBenefits;

  void _showLoading() {
    emit(
      state.copyWith(
        status: BenefitsLoading(),
      ),
    );
  }

  void _showError(Failure failure) {
    emit(
      state.copyWith(
        status: BenefitsError(
          failure.message,
        ),
      ),
    );
    emit(
      state.copyWith(
        status: BenefitsInitial(),
      ),
    );
  }

  Future<void> getCategories() async {
    _showLoading();
    final either = await _getCategories.call();
    either.fold(
      (failure) => _showError(failure),
      (result) {
        emit(
          state.copyWith(
            status: result.isNotEmpty ? state.status : BenefitsEmpty(),
            categories: result,
            categorySelected: result.first,
          ),
        );
        getBenefits();
      },
    );
  }

  Future<void> getBenefits() async {
    final either = await _getBenefits.call();
    either.fold(
      (failure) => _showError(failure),
      (result) {
        emit(
          state.copyWith(
            status: BenefitsSuccess(),
            benefits: result,
            benefitsFiltered: result
                .where(
                  (benefit) => state.categorySelected.id == benefit.categoryId,
                )
                .toList(),
          ),
        );
      },
    );
  }

  void selectCategory(Category category) {
    emit(
      state.copyWith(
        benefitsFiltered: state.benefits
            .where(
              (benefit) => benefit.categoryId == category.id,
            )
            .toList(),
        categorySelected: category,
      ),
    );
  }
}
