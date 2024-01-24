part of 'radio_cubit.dart';

class RadioState extends Equatable {
  const RadioState({
    required this.status,
  });

  final RadioStatus status;

  RadioState copyWith({
    RadioStatus? status,
  }) {
    return RadioState(
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [
        status,
      ];
}

abstract class RadioStatus {}

class RadioInitial extends RadioStatus {}

class RadioLoading extends RadioStatus {}

class RadioSuccess extends RadioStatus {}

class RadioError extends RadioStatus {
  RadioError(this.text);

  final String text;
}
