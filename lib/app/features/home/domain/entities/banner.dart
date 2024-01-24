part of 'entities.dart';

class Banner extends Equatable {
  const Banner({
    required this.id,
    required this.name,
    required this.url,
    required this.logo,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Banner.empty() {
    return Banner(
      id: '',
      name: '',
      url: '',
      logo: '',
      status: false,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  Banner copyWith({
    String? id,
    String? name,
    String? url,
    String? logo,
    bool? status,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Banner(
      id: id ?? this.id,
      name: name ?? this.name,
      url: url ?? this.url,
      logo: logo ?? this.logo,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  final String id;
  final String name;
  final String url;
  final String logo;
  final bool status;
  final DateTime createdAt;
  final DateTime updatedAt;

  @override
  List<Object?> get props => [
        id,
        name,
        url,
        logo,
        status,
        createdAt,
        updatedAt,
      ];
}
