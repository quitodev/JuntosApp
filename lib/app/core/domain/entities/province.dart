part of 'entities.dart';

class Province extends Equatable {
  const Province({
    required this.id,
    required this.name,
    required this.districts,
  });

  factory Province.empty() {
    return Province(
      id: '',
      name: '',
      districts: List.empty(),
    );
  }

  Province copyWith({
    String? id,
    String? name,
    List<District>? districts,
  }) {
    return Province(
      id: id ?? this.id,
      name: name ?? this.name,
      districts: districts ?? this.districts,
    );
  }

  final String id;
  final String name;
  final List<District> districts;

  @override
  List<Object?> get props => [
        id,
        name,
        districts,
      ];
}
