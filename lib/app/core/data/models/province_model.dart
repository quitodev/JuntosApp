part of 'models.dart';

class ProvinceModel extends Province {
  const ProvinceModel({
    required super.id,
    required super.name,
    required super.districts,
  });

  factory ProvinceModel.fromEntity(Province province) {
    return ProvinceModel(
      id: province.id,
      name: province.name,
      districts: province.districts,
    );
  }

  factory ProvinceModel.fromJson(dynamic json) {
    return ProvinceModel(
      id: json['id'] == null ? '' : json['id'] as String,
      name: json['name'] == null ? '' : json['name'] as String,
      districts: json['distrito'] == null
          ? List.empty()
          : List.from(
              (json['distrito'] as List).map(
                (data) => DistrictModel.fromJson(
                  data as Map<String, dynamic>,
                ),
              ),
            ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'provincia': districts,
    };
  }
}

extension ProvinceMapper on ProvinceModel {
  Province toEntity() {
    return Province(
      id: id,
      name: name,
      districts: districts,
    );
  }
}
