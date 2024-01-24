part of 'entities.dart';

class Winner extends Equatable {
  const Winner({
    required this.id,
    required this.banner,
    required this.publish,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Winner.empty() {
    return Winner(
      id: '',
      banner: '',
      publish: DateTime.now(),
      status: false,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  Winner copyWith({
    String? id,
    String? banner,
    DateTime? publish,
    bool? status,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Winner(
      id: id ?? this.id,
      banner: banner ?? this.banner,
      publish: publish ?? this.publish,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  final String id;
  final String banner;
  final DateTime publish;
  final bool status;
  final DateTime createdAt;
  final DateTime updatedAt;

  @override
  List<Object?> get props => [
        id,
        banner,
        publish,
        status,
        createdAt,
        updatedAt,
      ];
}
