part of 'models.dart';

class InstitutionModel extends Institution {
  const InstitutionModel({
    required super.id,
    required super.name,
    required super.logo,
    required super.label,
  });

  factory InstitutionModel.fromEntity(Institution institution) {
    return InstitutionModel(
      id: institution.id,
      name: institution.name,
      logo: institution.logo,
      label: institution.label,
    );
  }

  factory InstitutionModel.fromJson(dynamic json) {
    return InstitutionModel(
      id: json['id'] == null ? '' : json['id'] as String,
      name: json['name'] == null ? '' : json['name'] as String,
      logo: json['logo'] == null ? '' : json['logo'] as String,
      label: json['label'] == null ? '' : json['label'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'logo': logo,
      'label': label,
    };
  }
}

extension InstitutionMapper on InstitutionModel {
  Institution toEntity() {
    return Institution(
      id: id,
      name: name,
      logo: logo,
      label: label,
    );
  }
}
