part of 'models.dart';

class AvatarModel extends Avatar {
  const AvatarModel({
    required super.avatar,
    required super.privateUrl,
    required super.filename,
  });

  factory AvatarModel.fromEntity(Avatar avatar) {
    return AvatarModel(
      avatar: avatar.avatar,
      privateUrl: avatar.privateUrl,
      filename: avatar.filename,
    );
  }

  factory AvatarModel.fromJson(dynamic json) {
    return AvatarModel(
      avatar: json['avatar'] == null ? File('') : json['avatar'] as File,
      privateUrl:
          json['privateUrl'] == null ? '' : json['privateUrl'] as String,
      filename: json['filename'] == null ? '' : json['filename'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'avatar': avatar,
      'privateUrl': privateUrl,
      'filename': filename,
    };
  }
}

extension AvatarMapper on AvatarModel {
  Avatar toEntity() {
    return Avatar(
      avatar: avatar,
      privateUrl: privateUrl,
      filename: filename,
    );
  }
}
