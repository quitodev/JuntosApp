part of 'recovery_password_cubit.dart';

class RecoveryPasswordState extends Equatable {
  const RecoveryPasswordState({
    required this.status,
    required this.email,
  });

  final RecoveryPasswordStatus status;
  final String email;

  RecoveryPasswordState copyWith({
    RecoveryPasswordStatus? status,
    String? email,
  }) {
    return RecoveryPasswordState(
      status: status ?? this.status,
      email: email ?? this.email,
    );
  }

  @override
  List<Object> get props => [
        status,
        email,
      ];
}

abstract class RecoveryPasswordStatus {}

class RecoveryPasswordInitial extends RecoveryPasswordStatus {}

class RecoveryPasswordLoading extends RecoveryPasswordStatus {}

class RecoveryPasswordSuccess extends RecoveryPasswordStatus {}

class RecoveryPasswordError extends RecoveryPasswordStatus {
  RecoveryPasswordError(this.text);

  final String text;
}
