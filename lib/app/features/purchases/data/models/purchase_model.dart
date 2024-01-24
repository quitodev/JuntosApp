part of 'models.dart';

class PurchaseModel extends Purchase {
  const PurchaseModel({
    required super.id,
    required super.productId,
    required super.pricePayment,
    required super.paymentMethod,
    required super.userId,
    required super.link,
    required super.createdAt,
    required super.updatedAt,
    required super.product,
  });

  factory PurchaseModel.fromEntity(Purchase purchase) {
    return PurchaseModel(
      id: purchase.id,
      productId: purchase.productId,
      pricePayment: purchase.pricePayment,
      paymentMethod: purchase.paymentMethod,
      userId: purchase.userId,
      link: purchase.link,
      createdAt: purchase.createdAt,
      updatedAt: purchase.updatedAt,
      product: purchase.product,
    );
  }

  factory PurchaseModel.fromJson(dynamic json) {
    String getDateFormatted(String date) {
      final newDate = DateTime.parse(date.replaceAll('.000', ''));
      return '${newDate.day}.${newDate.month}.${newDate.year}';
    }

    return PurchaseModel(
      id: json['id'] == null ? '' : json['id'] as String,
      productId: json['productId'] == null ? '' : json['productId'] as String,
      pricePayment:
          json['pricePayment'] == null ? '' : json['pricePayment'] as String,
      paymentMethod:
          json['paymentMethod'] == null ? '' : json['paymentMethod'] as String,
      userId: json['userId'] == null ? '' : json['userId'] as String,
      link: json['link'] == null ? '' : json['link'] as String,
      createdAt: json['createdAt'] == null
          ? ''
          : getDateFormatted(json['createdAt'].toString()),
      updatedAt: json['updatedAt'] == null
          ? DateTime.now()
          : DateTime.parse(json['updatedAt'].toString()),
      product: json['Product'] == null
          ? Product.empty()
          : ProductModel.fromJson(
              json['Product'] as Map<String, dynamic>,
            ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'productId': productId,
      'pricePayment': pricePayment,
      'paymentMethod': paymentMethod,
      'userId': userId,
      'link': link,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'product': product,
    };
  }
}

extension PurchaseMapper on PurchaseModel {
  Purchase toEntity() {
    return Purchase(
      id: id,
      productId: productId,
      pricePayment: pricePayment,
      paymentMethod: paymentMethod,
      userId: userId,
      link: link,
      createdAt: createdAt,
      updatedAt: updatedAt,
      product: product,
    );
  }
}
