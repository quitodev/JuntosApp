part of 'models.dart';

class DistrictModel extends District {
  const DistrictModel({
    required super.id,
    required super.name,
  });

  factory DistrictModel.fromEntity(District district) {
    return DistrictModel(
      id: district.id,
      name: district.name,
    );
  }

  factory DistrictModel.fromJson(dynamic json) {
    return DistrictModel(
      id: json['id'] == null ? '' : json['id'] as String,
      name: json['name'] == null ? '' : json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}

extension DistrictMapper on DistrictModel {
  District toEntity() {
    return District(
      id: id,
      name: name,
    );
  }
}
