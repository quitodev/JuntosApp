part of 'giveaways_cubit.dart';

class GiveawaysState extends Equatable {
  const GiveawaysState({
    required this.status,
    required this.giveaways,
  });

  final GiveawaysStatus status;
  final List<Giveaway> giveaways;

  GiveawaysState copyWith({
    GiveawaysStatus? status,
    List<Giveaway>? giveaways,
  }) {
    return GiveawaysState(
      status: status ?? this.status,
      giveaways: giveaways ?? this.giveaways,
    );
  }

  @override
  List<Object> get props => [
        status,
        giveaways,
      ];
}

abstract class GiveawaysStatus {}

class GiveawaysInitial extends GiveawaysStatus {}

class GiveawaysLoading extends GiveawaysStatus {}

class GiveawaysSuccess extends GiveawaysStatus {}

class GiveawaysEmpty extends GiveawaysStatus {}

class GiveawaysError extends GiveawaysStatus {
  GiveawaysError(this.text);

  final String text;
}
