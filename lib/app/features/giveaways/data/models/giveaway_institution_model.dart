part of 'models.dart';

class GiveawayInstitutionModel extends GiveawayInstitution {
  const GiveawayInstitutionModel({
    required super.id,
    required super.raffleId,
    required super.institutionId,
    required super.createdAt,
    required super.updatedAt,
  });

  factory GiveawayInstitutionModel.fromEntity(
    GiveawayInstitution giveawayInstitution,
  ) {
    return GiveawayInstitutionModel(
      id: giveawayInstitution.id,
      raffleId: giveawayInstitution.raffleId,
      institutionId: giveawayInstitution.institutionId,
      createdAt: giveawayInstitution.createdAt,
      updatedAt: giveawayInstitution.updatedAt,
    );
  }

  factory GiveawayInstitutionModel.fromJson(dynamic json) {
    return GiveawayInstitutionModel(
      id: json['id'] == null ? '' : json['id'] as String,
      raffleId: json['raffleId'] == null ? '' : json['raffleId'] as String,
      institutionId:
          json['institutionId'] == null ? '' : json['institutionId'] as String,
      createdAt: json['createdAt'] == null
          ? DateTime.now()
          : DateTime.parse(json['createdAt'].toString()),
      updatedAt: json['updatedAt'] == null
          ? DateTime.now()
          : DateTime.parse(json['updatedAt'].toString()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'raffleId': raffleId,
      'institutionId': institutionId,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}

extension GiveawayInstitutionMapper on GiveawayInstitutionModel {
  GiveawayInstitution toEntity() {
    return GiveawayInstitution(
      id: id,
      raffleId: raffleId,
      institutionId: institutionId,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
