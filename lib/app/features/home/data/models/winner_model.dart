part of 'models.dart';

class WinnerModel extends Winner {
  const WinnerModel({
    required super.id,
    required super.banner,
    required super.publish,
    required super.status,
    required super.createdAt,
    required super.updatedAt,
  });

  factory WinnerModel.fromEntity(Winner winner) {
    return WinnerModel(
      id: winner.id,
      banner: winner.banner,
      publish: winner.publish,
      status: winner.status,
      createdAt: winner.createdAt,
      updatedAt: winner.updatedAt,
    );
  }

  factory WinnerModel.fromJson(dynamic json) {
    return WinnerModel(
      id: json['id'] == null ? '' : json['id'] as String,
      banner: json['banner'] == null ? '' : json['banner'] as String,
      publish: json['publish'] == null
          ? DateTime.now().add(
              const Duration(hours: 72),
            )
          : DateTime.parse(json['publish'].toString().replaceAll('.000', '')),
      status: json['status'] == null ? false : json['status'] as bool,
      createdAt: json['createdAt'] == null
          ? DateTime.now()
          : DateTime.parse(json['createdAt'].toString()),
      updatedAt: json['updatedAt'] == null
          ? DateTime.now()
          : DateTime.parse(json['updatedAt'].toString()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'banner': banner,
      'publish': publish,
      'status': status,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}

extension WinnerMapper on WinnerModel {
  Winner toEntity() {
    return Winner(
      id: id,
      banner: banner,
      publish: publish,
      status: status,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
