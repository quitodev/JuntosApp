part of 'models.dart';

class GiveawayShareModel extends GiveawayShare {
  const GiveawayShareModel({
    required super.id,
    required super.raffleId,
    required super.userId,
    required super.createdAt,
    required super.updatedAt,
  });

  factory GiveawayShareModel.fromEntity(GiveawayShare giveawayShare) {
    return GiveawayShareModel(
      id: giveawayShare.id,
      raffleId: giveawayShare.raffleId,
      userId: giveawayShare.userId,
      createdAt: giveawayShare.createdAt,
      updatedAt: giveawayShare.updatedAt,
    );
  }

  factory GiveawayShareModel.fromJson(dynamic json) {
    return GiveawayShareModel(
      id: json['id'] == null ? '' : json['id'] as String,
      raffleId: json['raffleId'] == null ? '' : json['raffleId'] as String,
      userId: json['userId'] == null ? '' : json['userId'] as String,
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
      'userId': userId,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}

extension GiveawayShareMapper on GiveawayShareModel {
  GiveawayShare toEntity() {
    return GiveawayShare(
      id: id,
      raffleId: raffleId,
      userId: userId,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
