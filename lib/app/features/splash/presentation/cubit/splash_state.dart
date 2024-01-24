part of 'splash_cubit.dart';

class SplashState extends Equatable {
  const SplashState({
    required this.status,
  });

  final SplashStatus status;

  SplashState copyWith({
    SplashStatus? status,
  }) {
    return SplashState(
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [
        status,
      ];
}

abstract class SplashStatus {}

class SplashInitial extends SplashStatus {}

class SplashLoading extends SplashStatus {}

class SplashSuccess extends SplashStatus {}

class SplashError extends SplashStatus {
  SplashError(this.text);

  final String text;
}
