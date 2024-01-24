part of 'entities.dart';

class Notification extends Equatable {
  const Notification({
    required this.id,
    required this.body,
    required this.userId,
    required this.institutionId,
    required this.publish,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Notification.empty() {
    return Notification(
      id: '',
      body: '',
      userId: '',
      institutionId: '',
      publish: '',
      createdAt: '',
      updatedAt: DateTime.now(),
    );
  }

  Notification copyWith({
    String? id,
    String? body,
    String? userId,
    String? institutionId,
    String? publish,
    String? createdAt,
    DateTime? updatedAt,
  }) {
    return Notification(
      id: id ?? this.id,
      body: body ?? this.body,
      userId: userId ?? this.userId,
      institutionId: institutionId ?? this.institutionId,
      publish: publish ?? this.publish,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  final String id;
  final String body;
  final String userId;
  final String institutionId;
  final String publish;
  final String createdAt;
  final DateTime updatedAt;

  @override
  List<Object?> get props => [
        id,
        body,
        userId,
        institutionId,
        publish,
        createdAt,
        updatedAt,
      ];
}
