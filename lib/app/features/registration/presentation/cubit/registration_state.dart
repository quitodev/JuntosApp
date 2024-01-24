part of 'registration_cubit.dart';

class RegistrationState extends Equatable {
  const RegistrationState({
    required this.status,
    required this.account,
    required this.departments,
    required this.provinces,
    required this.institutions,
    required this.showPassword,
    required this.showRepeatedPassword,
  });

  final RegistrationStatus status;
  final Account account;
  final List<Department> departments;
  final List<Province> provinces;
  final List<Institution> institutions;
  final bool showPassword;
  final bool showRepeatedPassword;

  RegistrationState copyWith({
    RegistrationStatus? status,
    Account? account,
    List<Department>? departments,
    List<Province>? provinces,
    List<Institution>? institutions,
    bool? showPassword,
    bool? showRepeatedPassword,
  }) {
    return RegistrationState(
      status: status ?? this.status,
      account: account ?? this.account,
      departments: departments ?? this.departments,
      provinces: provinces ?? this.provinces,
      institutions: institutions ?? this.institutions,
      showPassword: showPassword ?? this.showPassword,
      showRepeatedPassword: showRepeatedPassword ?? this.showRepeatedPassword,
    );
  }

  @override
  List<Object> get props => [
        status,
        account,
        departments,
        provinces,
        institutions,
        showPassword,
        showRepeatedPassword,
      ];
}

abstract class RegistrationStatus {}

class RegistrationInitial extends RegistrationStatus {}

class RegistrationLoading extends RegistrationStatus {}

class RegistrationSuccess extends RegistrationStatus {}

class RegistrationError extends RegistrationStatus {
  RegistrationError(this.text);

  final String text;
}
