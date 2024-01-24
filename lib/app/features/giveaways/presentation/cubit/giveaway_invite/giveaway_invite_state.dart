part of 'giveaway_invite_cubit.dart';

class GiveawayInviteState extends Equatable {
  const GiveawayInviteState({
    required this.status,
    required this.giveaway,
  });

  final GiveawayInviteStatus status;
  final Giveaway giveaway;

  GiveawayInviteState copyWith({
    GiveawayInviteStatus? status,
    Giveaway? giveaway,
  }) {
    return GiveawayInviteState(
      status: status ?? this.status,
      giveaway: giveaway ?? this.giveaway,
    );
  }

  @override
  List<Object> get props => [
        status,
        giveaway,
      ];
}

abstract class GiveawayInviteStatus {}

class GiveawayInviteInitial extends GiveawayInviteStatus {}

class GiveawayInviteLoading extends GiveawayInviteStatus {}

class GiveawayInviteSuccess extends GiveawayInviteStatus {}

class GiveawayInviteError extends GiveawayInviteStatus {
  GiveawayInviteError(this.text);

  final String text;
}
