part of 'entities.dart';

class GiveawayShare extends Equatable {
  const GiveawayShare({
    required this.id,
    required this.raffleId,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory GiveawayShare.empty() {
    return GiveawayShare(
      id: '',
      raffleId: '',
      userId: '',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  GiveawayShare copyWith({
    String? id,
    String? raffleId,
    String? userId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return GiveawayShare(
      id: id ?? this.id,
      raffleId: raffleId ?? this.raffleId,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  final String id;
  final String raffleId;
  final String userId;
  final DateTime createdAt;
  final DateTime updatedAt;

  @override
  List<Object?> get props => [
        id,
        raffleId,
        userId,
        createdAt,
        updatedAt,
      ];
}
