part of 'models.dart';

class GiveawayModel extends Giveaway {
  const GiveawayModel({
    required super.id,
    required super.name,
    required super.banner,
    required super.startDate,
    required super.endDate,
    required super.iconSponsorCompany,
    required super.referentialPhoto,
    required super.conditions,
    required super.status,
    required super.createdAt,
    required super.updatedAt,
  });

  factory GiveawayModel.fromEntity(Giveaway giveaway) {
    return GiveawayModel(
      id: giveaway.id,
      name: giveaway.name,
      banner: giveaway.banner,
      startDate: giveaway.startDate,
      endDate: giveaway.endDate,
      iconSponsorCompany: giveaway.iconSponsorCompany,
      referentialPhoto: giveaway.referentialPhoto,
      conditions: giveaway.conditions,
      status: giveaway.status,
      createdAt: giveaway.createdAt,
      updatedAt: giveaway.updatedAt,
    );
  }

  factory GiveawayModel.fromJson(dynamic json) {
    String getDateFormatted(String date) {
      final newDate = DateTime.parse(date.replaceAll('.000', ''));
      return '${newDate.day} de ${DateFormat('MMMM', 'es').format(newDate)} de ${newDate.year} - ${DateFormat('jm').format(newDate)}';
    }

    return GiveawayModel(
      id: json['id'] == null ? '' : json['id'] as String,
      name: json['name'] == null ? '' : json['name'] as String,
      banner: json['banner'] == null ? '' : json['banner'] as String,
      startDate: json['startDate'] == null
          ? ''
          : getDateFormatted(json['startDate'].toString()),
      endDate: json['endDate'] == null
          ? ''
          : getDateFormatted(json['endDate'].toString()),
      iconSponsorCompany: json['iconSponsorCompany'] == null
          ? ''
          : json['iconSponsorCompany'] as String,
      referentialPhoto: json['referentialPhoto'] == null
          ? ''
          : json['referentialPhoto'] as String,
      conditions:
          json['conditions'] == null ? '' : json['conditions'] as String,
      status: json['status'] == null ? false : json['status'] as bool,
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
      'name': name,
      'banner': banner,
      'startDate': startDate,
      'endDate': endDate,
      'iconSponsorCompany': iconSponsorCompany,
      'referentialPhoto': referentialPhoto,
      'conditions': conditions,
      'status': status,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}

extension GiveawayMapper on GiveawayModel {
  Giveaway toEntity() {
    return Giveaway(
      id: id,
      name: name,
      banner: banner,
      startDate: startDate,
      endDate: endDate,
      iconSponsorCompany: iconSponsorCompany,
      referentialPhoto: referentialPhoto,
      conditions: conditions,
      status: status,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
