part of 'login_cubit.dart';

class LoginState extends Equatable {
  const LoginState({
    required this.status,
    required this.email,
    required this.password,
    required this.showPassword,
    required this.rememberSession,
    required this.account,
  });

  final LoginStatus status;
  final String email;
  final String password;
  final bool showPassword;
  final bool rememberSession;
  final Account account;

  LoginState copyWith({
    LoginStatus? status,
    String? email,
    String? password,
    bool? showPassword,
    bool? rememberSession,
    Account? account,
  }) {
    return LoginState(
      status: status ?? this.status,
      email: email ?? this.email,
      password: password ?? this.password,
      showPassword: showPassword ?? this.showPassword,
      rememberSession: rememberSession ?? this.rememberSession,
      account: account ?? this.account,
    );
  }

  @override
  List<Object> get props => [
        status,
        email,
        password,
        showPassword,
        rememberSession,
        account,
      ];
}

abstract class LoginStatus {}

class LoginInitial extends LoginStatus {}

class LoginLoading extends LoginStatus {}

class LoginSuccess extends LoginStatus {}

class LoginError extends LoginStatus {
  LoginError(this.text);

  final String text;
}
