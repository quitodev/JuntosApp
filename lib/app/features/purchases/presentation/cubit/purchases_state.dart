part of 'purchases_cubit.dart';

class PurchasesState extends Equatable {
  const PurchasesState({
    required this.status,
    required this.purchases,
  });

  final PurchasesStatus status;
  final List<Purchase> purchases;

  PurchasesState copyWith({
    PurchasesStatus? status,
    List<Purchase>? purchases,
  }) {
    return PurchasesState(
      status: status ?? this.status,
      purchases: purchases ?? this.purchases,
    );
  }

  @override
  List<Object> get props => [
        status,
        purchases,
      ];
}

abstract class PurchasesStatus {}

class PurchasesInitial extends PurchasesStatus {}

class PurchasesLoading extends PurchasesStatus {}

class PurchasesSuccess extends PurchasesStatus {}

class PurchasesEmpty extends PurchasesStatus {}

class PurchasesError extends PurchasesStatus {
  PurchasesError(this.text);

  final String text;
}
