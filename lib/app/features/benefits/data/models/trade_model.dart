part of 'models.dart';

class TradeModel extends Trade {
  const TradeModel({
    required super.id,
    required super.name,
    required super.email,
    required super.phone,
    required super.url,
    required super.logo,
    required super.status,
    required super.createdAt,
    required super.updatedAt,
    required super.productId,
  });

  factory TradeModel.fromEntity(Trade trade) {
    return TradeModel(
      id: trade.id,
      name: trade.name,
      email: trade.email,
      phone: trade.phone,
      url: trade.url,
      logo: trade.logo,
      status: trade.status,
      createdAt: trade.createdAt,
      updatedAt: trade.updatedAt,
      productId: trade.productId,
    );
  }

  factory TradeModel.fromJson(dynamic json) {
    return TradeModel(
      id: json['id'] == null ? '' : json['id'] as String,
      name: json['name'] == null ? '' : (json['name'] as String).toUpperCase(),
      email: json['email'] == null ? '' : json['email'] as String,
      phone: json['phone'] == null ? '' : json['phone'] as String,
      url: json['url'] == null ? '' : json['url'] as String,
      logo: json['logo'] == null ? '' : json['logo'] as String,
      status: json['status'] == null ? false : json['status'] as bool,
      createdAt: json['createdAt'] == null
          ? DateTime.now()
          : DateTime.parse(json['createdAt'].toString()),
      updatedAt: json['updatedAt'] == null
          ? DateTime.now()
          : DateTime.parse(json['updatedAt'].toString()),
      productId: json['productId'] == null ? '' : json['productId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'url': url,
      'logo': logo,
      'status': status,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'productId': productId,
    };
  }
}

extension TradeMapper on TradeModel {
  Trade toEntity() {
    return Trade(
      id: id,
      name: name,
      email: email,
      phone: phone,
      url: url,
      logo: logo,
      status: status,
      createdAt: createdAt,
      updatedAt: updatedAt,
      productId: productId,
    );
  }
}
