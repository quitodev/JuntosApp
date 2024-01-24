part of 'entities.dart';

class Avatar extends Equatable {
  const Avatar({
    required this.avatar,
    required this.privateUrl,
    required this.filename,
  });

  factory Avatar.empty() {
    return Avatar(
      avatar: File(''),
      privateUrl: 'avatar',
      filename: '',
    );
  }

  Avatar copyWith({
    File? avatar,
    String? privateUrl,
    String? filename,
  }) {
    return Avatar(
      avatar: avatar ?? this.avatar,
      privateUrl: privateUrl ?? this.privateUrl,
      filename: filename ?? this.filename,
    );
  }

  final File avatar;
  final String privateUrl;
  final String filename;

  @override
  List<Object?> get props => [
        avatar,
        privateUrl,
        filename,
      ];
}
