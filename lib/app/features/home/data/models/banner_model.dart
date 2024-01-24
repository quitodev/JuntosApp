part of 'models.dart';

class BannerModel extends Banner {
  const BannerModel({
    required super.id,
    required super.name,
    required super.url,
    required super.logo,
    required super.status,
    required super.createdAt,
    required super.updatedAt,
  });

  factory BannerModel.fromEntity(Banner banner) {
    return BannerModel(
      id: banner.id,
      name: banner.name,
      url: banner.url,
      logo: banner.logo,
      status: banner.status,
      createdAt: banner.createdAt,
      updatedAt: banner.updatedAt,
    );
  }

  factory BannerModel.fromJson(dynamic json) {
    return BannerModel(
      id: json['id'] == null ? '' : json['id'] as String,
      name: json['name'] == null ? '' : json['name'] as String,
      url: json['url'] == null ? '' : json['url'] as String,
      logo: json['logo'] == null ? '' : json['logo'] as String,
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
      'name': name,
      'url': url,
      'logo': logo,
      'status': status,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}

extension BannerMapper on BannerModel {
  Banner toEntity() {
    return Banner(
      id: id,
      name: name,
      url: url,
      logo: logo,
      status: status,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
