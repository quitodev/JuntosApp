part of 'models.dart';

class PostModel extends Post {
  const PostModel({
    required super.id,
    required super.title,
    required super.image,
    required super.video,
    required super.institutionId,
    required super.typePost,
    required super.createdAt,
    required super.updatedAt,
  });

  factory PostModel.fromEntity(Post post) {
    return PostModel(
      id: post.id,
      title: post.title,
      image: post.image,
      video: post.video,
      institutionId: post.institutionId,
      typePost: post.typePost,
      createdAt: post.createdAt,
      updatedAt: post.updatedAt,
    );
  }

  factory PostModel.fromJson(dynamic json) {
    String getDateFormatted(String date) {
      final newDate = DateTime.parse(date.replaceAll('.000', ''));
      return '${newDate.day}.${newDate.month}.${newDate.year}';
    }

    return PostModel(
      id: json['id'] == null ? '' : json['id'] as String,
      title: json['title'] == null ? '' : json['title'] as String,
      image: json['image'] == null ? '' : json['image'] as String,
      video: json['video'] == null ? '' : json['video'] as String,
      institutionId:
          json['institutionId'] == null ? '' : json['institutionId'] as String,
      typePost: json['typePost'] == null ? '' : json['typePost'] as String,
      createdAt: json['createdAt'] == null
          ? ''
          : getDateFormatted(json['createdAt'].toString()),
      updatedAt: json['updatedAt'] == null
          ? DateTime.now()
          : DateTime.parse(json['updatedAt'].toString()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'image': image,
      'video': video,
      'institutionId': institutionId,
      'typePost': typePost,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}

extension PostMapper on PostModel {
  Post toEntity() {
    return Post(
      id: id,
      title: title,
      image: image,
      video: video,
      institutionId: institutionId,
      typePost: typePost,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
