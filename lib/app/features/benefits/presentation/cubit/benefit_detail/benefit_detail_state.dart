part of 'benefit_detail_cubit.dart';

class BenefitDetailState extends Equatable {
  const BenefitDetailState({
    required this.status,
  });

  final BenefitDetailStatus status;

  BenefitDetailState copyWith({
    BenefitDetailStatus? status,
  }) {
    return BenefitDetailState(
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [
        status,
      ];
}

abstract class BenefitDetailStatus {}

class BenefitDetailInitial extends BenefitDetailStatus {}

class BenefitDetailLoading extends BenefitDetailStatus {}

class BenefitDetailSuccess extends BenefitDetailStatus {}

class BenefitDetailError extends BenefitDetailStatus {
  BenefitDetailError(this.text);

  final String text;
}
