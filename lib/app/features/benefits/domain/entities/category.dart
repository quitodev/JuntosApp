part of 'entities.dart';

class Category extends Equatable {
  const Category({
    required this.id,
    required this.name,
    required this.icon,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Category.empty() {
    return Category(
      id: '',
      name: '',
      icon: '',
      status: false,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  Category copyWith({
    String? id,
    String? name,
    String? icon,
    bool? status,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Category(
      id: id ?? this.id,
      name: name ?? this.name,
      icon: icon ?? this.icon,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  final String id;
  final String name;
  final String icon;
  final bool status;
  final DateTime createdAt;
  final DateTime updatedAt;

  @override
  List<Object?> get props => [
        id,
        name,
        icon,
        status,
        createdAt,
        updatedAt,
      ];
}
