part of 'complete_registration_cubit.dart';

class CompleteRegistrationState extends Equatable {
  const CompleteRegistrationState({
    required this.status,
    required this.verificationCode,
  });

  final CompleteRegistrationStatus status;
  final String verificationCode;

  CompleteRegistrationState copyWith({
    CompleteRegistrationStatus? status,
    String? verificationCode,
  }) {
    return CompleteRegistrationState(
      status: status ?? this.status,
      verificationCode: verificationCode ?? this.verificationCode,
    );
  }

  @override
  List<Object> get props => [
        status,
        verificationCode,
      ];
}

abstract class CompleteRegistrationStatus {}

class CompleteRegistrationInitial extends CompleteRegistrationStatus {}

class CompleteRegistrationLoading extends CompleteRegistrationStatus {}

class CompleteRegistrationSuccess extends CompleteRegistrationStatus {}

class CompleteRegistrationError extends CompleteRegistrationStatus {
  CompleteRegistrationError(this.text);

  final String text;
}
