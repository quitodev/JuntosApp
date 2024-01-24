part of 'entities.dart';

class Giveaway extends Equatable {
  const Giveaway({
    required this.id,
    required this.name,
    required this.banner,
    required this.startDate,
    required this.endDate,
    required this.iconSponsorCompany,
    required this.referentialPhoto,
    required this.conditions,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Giveaway.empty() {
    return Giveaway(
      id: '',
      name: '',
      banner: '',
      startDate: '',
      endDate: '',
      iconSponsorCompany: '',
      referentialPhoto: '',
      conditions: '',
      status: false,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  Giveaway copyWith({
    String? id,
    String? name,
    String? banner,
    String? startDate,
    String? endDate,
    String? iconSponsorCompany,
    String? referentialPhoto,
    String? conditions,
    bool? status,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Giveaway(
      id: id ?? this.id,
      name: name ?? this.name,
      banner: banner ?? this.banner,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      iconSponsorCompany: iconSponsorCompany ?? this.iconSponsorCompany,
      referentialPhoto: referentialPhoto ?? this.referentialPhoto,
      conditions: conditions ?? this.conditions,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  final String id;
  final String name;
  final String banner;
  final String startDate;
  final String endDate;
  final String iconSponsorCompany;
  final String referentialPhoto;
  final String conditions;
  final bool status;
  final DateTime createdAt;
  final DateTime updatedAt;

  @override
  List<Object?> get props => [
        id,
        name,
        banner,
        startDate,
        endDate,
        iconSponsorCompany,
        referentialPhoto,
        conditions,
        status,
        createdAt,
        updatedAt,
      ];
}
