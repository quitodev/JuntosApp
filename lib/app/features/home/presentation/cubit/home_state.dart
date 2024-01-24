part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({
    required this.status,
    required this.account,
    required this.banners,
    required this.winner,
  });

  final HomeStatus status;
  final Account account;
  final List<Banner> banners;
  final Winner winner;

  HomeState copyWith({
    HomeStatus? status,
    Account? account,
    List<Banner>? banners,
    Winner? winner,
  }) {
    return HomeState(
      status: status ?? this.status,
      account: account ?? this.account,
      banners: banners ?? this.banners,
      winner: winner ?? this.winner,
    );
  }

  @override
  List<Object> get props => [
        status,
        account,
        banners,
        winner,
      ];
}

abstract class HomeStatus {}

class HomeInitial extends HomeStatus {}

class HomeLoading extends HomeStatus {}

class HomeSuccess extends HomeStatus {}

class HomeCompleteRegistration extends HomeStatus {}

class HomeUserSuspended extends HomeStatus {}

class HomeUserWinner extends HomeStatus {}

class HomeError extends HomeStatus {
  HomeError(this.text);

  final String text;
}
