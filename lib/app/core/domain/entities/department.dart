part of 'entities.dart';

class Department extends Equatable {
  const Department({
    required this.id,
    required this.name,
  });

  factory Department.empty() {
    return const Department(
      id: '',
      name: '',
    );
  }

  Department copyWith({
    String? id,
    String? name,
  }) {
    return Department(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  final String id;
  final String name;

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
