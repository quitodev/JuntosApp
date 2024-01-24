part of 'benefits_cubit.dart';

class BenefitsState extends Equatable {
  const BenefitsState({
    required this.status,
    required this.categories,
    required this.benefits,
    required this.benefitsFiltered,
    required this.categorySelected,
  });

  final BenefitsStatus status;
  final List<Category> categories;
  final List<Benefit> benefits;
  final List<Benefit> benefitsFiltered;
  final Category categorySelected;

  BenefitsState copyWith({
    BenefitsStatus? status,
    List<Category>? categories,
    List<Benefit>? benefits,
    List<Benefit>? benefitsFiltered,
    Category? categorySelected,
  }) {
    return BenefitsState(
      status: status ?? this.status,
      categories: categories ?? this.categories,
      benefits: benefits ?? this.benefits,
      benefitsFiltered: benefitsFiltered ?? this.benefitsFiltered,
      categorySelected: categorySelected ?? this.categorySelected,
    );
  }

  @override
  List<Object> get props => [
        status,
        categories,
        benefits,
        benefitsFiltered,
        categorySelected,
      ];
}

abstract class BenefitsStatus {}

class BenefitsInitial extends BenefitsStatus {}

class BenefitsLoading extends BenefitsStatus {}

class BenefitsSuccess extends BenefitsStatus {}

class BenefitsEmpty extends BenefitsStatus {}

class BenefitsError extends BenefitsStatus {
  BenefitsError(this.text);

  final String text;
}
