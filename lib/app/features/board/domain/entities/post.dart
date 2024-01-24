part of 'entities.dart';

class Post extends Equatable {
  const Post({
    required this.id,
    required this.title,
    required this.image,
    required this.video,
    required this.institutionId,
    required this.typePost,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Post.empty() {
    return Post(
      id: '',
      title: '',
      image: '',
      video: '',
      institutionId: '',
      typePost: '',
      createdAt: '',
      updatedAt: DateTime.now(),
    );
  }

  Post copyWith({
    String? id,
    String? title,
    String? image,
    String? video,
    String? institutionId,
    String? typePost,
    String? createdAt,
    DateTime? updatedAt,
  }) {
    return Post(
      id: id ?? this.id,
      title: title ?? this.title,
      image: image ?? this.image,
      video: video ?? this.video,
      institutionId: institutionId ?? this.institutionId,
      typePost: typePost ?? this.typePost,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  final String id;
  final String title;
  final String image;
  final String video;
  final String institutionId;
  final String typePost;
  final String createdAt;
  final DateTime updatedAt;

  @override
  List<Object?> get props => [
        id,
        title,
        image,
        video,
        institutionId,
        typePost,
        createdAt,
        updatedAt,
      ];
}
