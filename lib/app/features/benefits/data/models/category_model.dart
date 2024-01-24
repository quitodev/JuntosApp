part of 'models.dart';

class CategoryModel extends Category {
  const CategoryModel({
    required super.id,
    required super.name,
    required super.icon,
    required super.status,
    required super.createdAt,
    required super.updatedAt,
  });

  factory CategoryModel.fromEntity(Category category) {
    return CategoryModel(
      id: category.id,
      name: category.name,
      icon: category.icon,
      status: category.status,
      createdAt: category.createdAt,
      updatedAt: category.updatedAt,
    );
  }

  factory CategoryModel.fromJson(dynamic json) {
    return CategoryModel(
      id: json['id'] == null ? '' : json['id'] as String,
      name: json['name'] == null ? '' : json['name'] as String,
      icon: json['icon'] == null ? '' : json['icon'] as String,
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
      'icon': icon,
      'status': status,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}

extension CategoryMapper on CategoryModel {
  Category toEntity() {
    return Category(
      id: id,
      name: name,
      icon: icon,
      status: status,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
