part of 'entities.dart';

class GiveawayInstitution extends Equatable {
  const GiveawayInstitution({
    required this.id,
    required this.raffleId,
    required this.institutionId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory GiveawayInstitution.empty() {
    return GiveawayInstitution(
      id: '',
      raffleId: '',
      institutionId: '',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  GiveawayInstitution copyWith({
    String? id,
    String? raffleId,
    String? institutionId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return GiveawayInstitution(
      id: id ?? this.id,
      raffleId: raffleId ?? this.raffleId,
      institutionId: institutionId ?? this.institutionId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  final String id;
  final String raffleId;
  final String institutionId;
  final DateTime createdAt;
  final DateTime updatedAt;

  @override
  List<Object?> get props => [
        id,
        raffleId,
        institutionId,
        createdAt,
        updatedAt,
      ];
}
