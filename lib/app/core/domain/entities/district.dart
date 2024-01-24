part of 'entities.dart';

class District extends Equatable {
  const District({
    required this.id,
    required this.name,
  });

  factory District.empty() {
    return const District(
      id: '',
      name: '',
    );
  }

  District copyWith({
    String? id,
    String? name,
  }) {
    return District(
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
