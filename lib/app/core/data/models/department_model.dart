part of 'models.dart';

class DepartmentModel extends Department {
  const DepartmentModel({
    required super.id,
    required super.name,
  });

  factory DepartmentModel.fromEntity(Department deparment) {
    return DepartmentModel(
      id: deparment.id,
      name: deparment.name,
    );
  }

  factory DepartmentModel.fromJson(dynamic json) {
    return DepartmentModel(
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

extension DepartmentMapper on DepartmentModel {
  Department toEntity() {
    return Department(
      id: id,
      name: name,
    );
  }
}
