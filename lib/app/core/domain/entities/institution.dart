part of 'entities.dart';

class Institution extends Equatable {
  const Institution({
    required this.id,
    required this.name,
    required this.logo,
    required this.label,
  });

  factory Institution.empty() {
    return const Institution(
      id: '',
      name: '',
      logo: '',
      label: '',
    );
  }

  Institution copyWith({
    String? id,
    String? name,
    String? logo,
    String? label,
  }) {
    return Institution(
      id: id ?? this.id,
      name: name ?? this.name,
      logo: logo ?? this.logo,
      label: label ?? this.label,
    );
  }

  final String id;
  final String name;
  final String logo;
  final String label;

  @override
  List<Object?> get props => [
        id,
        name,
        logo,
        label,
      ];
}
