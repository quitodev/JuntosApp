part of 'models.dart';

class ProductModel extends Product {
  const ProductModel({
    required super.id,
    required super.productName,
    required super.discountCode,
    required super.description,
    required super.price,
    required super.offerPrice,
    required super.startDate,
    required super.periodEnd,
    required super.stock,
    required super.photo,
    required super.status,
    required super.tradeId,
    required super.categoryId,
    required super.createdAt,
    required super.updatedAt,
  });

  factory ProductModel.fromEntity(Product product) {
    return ProductModel(
      id: product.id,
      productName: product.productName,
      discountCode: product.discountCode,
      description: product.description,
      price: product.price,
      offerPrice: product.offerPrice,
      startDate: product.startDate,
      periodEnd: product.periodEnd,
      stock: product.stock,
      photo: product.photo,
      status: product.status,
      tradeId: product.tradeId,
      categoryId: product.categoryId,
      createdAt: product.createdAt,
      updatedAt: product.updatedAt,
    );
  }

  factory ProductModel.fromJson(dynamic json) {
    String getDateFormatted(String date) {
      final newDate = DateTime.parse(date.replaceAll('.000', ''));
      return '${newDate.day} de ${DateFormat('MMMM', 'es').format(newDate)} de ${newDate.year}';
    }

    return ProductModel(
      id: json['id'] == null ? '' : json['id'] as String,
      productName:
          json['productName'] == null ? '' : json['productName'] as String,
      discountCode:
          json['discountCode'] == null ? '' : json['discountCode'] as String,
      description:
          json['description'] == null ? '' : json['description'] as String,
      price: json['price'] == null
          ? ''
          : 'S/${(json['price'] as int).toDouble().toStringAsFixed(2)}',
      offerPrice: json['offerPrice'] == null
          ? ''
          : 'S/${(json['offerPrice'] as int).toDouble().toStringAsFixed(2)}',
      startDate: json['startDate'] == null
          ? ''
          : getDateFormatted(json['startDate'].toString()),
      periodEnd: json['periodEnd'] == null
          ? ''
          : getDateFormatted(json['periodEnd'].toString()),
      stock: json['stock'] == null ? 0 : json['stock'] as int,
      photo: json['photo'] == null ? '' : json['photo'] as String,
      status: json['status'] == null ? false : json['status'] as bool,
      tradeId: json['tradeId'] == null ? '' : json['tradeId'] as String,
      categoryId:
          json['categoryId'] == null ? '' : json['categoryId'] as String,
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
      'productName': productName,
      'discountCode': discountCode,
      'description': description,
      'price': price,
      'offerPrice': offerPrice,
      'startDate': startDate,
      'periodEnd': periodEnd,
      'stock': stock,
      'photo': photo,
      'status': status,
      'tradeId': tradeId,
      'categoryId': categoryId,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}

extension ProductMapper on ProductModel {
  Product toEntity() {
    return Product(
      id: id,
      productName: productName,
      discountCode: discountCode,
      description: description,
      price: price,
      offerPrice: offerPrice,
      startDate: startDate,
      periodEnd: periodEnd,
      stock: stock,
      photo: photo,
      status: status,
      tradeId: tradeId,
      categoryId: categoryId,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
