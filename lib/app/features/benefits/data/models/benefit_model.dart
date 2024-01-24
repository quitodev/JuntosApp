part of 'models.dart';

class BenefitModel extends Benefit {
  const BenefitModel({
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
    required super.category,
    required super.trade,
  });

  factory BenefitModel.fromEntity(Benefit benefit) {
    return BenefitModel(
      id: benefit.id,
      productName: benefit.productName,
      discountCode: benefit.discountCode,
      description: benefit.description,
      price: benefit.price,
      offerPrice: benefit.offerPrice,
      startDate: benefit.startDate,
      periodEnd: benefit.periodEnd,
      stock: benefit.stock,
      photo: benefit.photo,
      status: benefit.status,
      tradeId: benefit.tradeId,
      categoryId: benefit.categoryId,
      createdAt: benefit.createdAt,
      updatedAt: benefit.updatedAt,
      category: benefit.category,
      trade: benefit.trade,
    );
  }

  factory BenefitModel.fromJson(dynamic json) {
    String getDateFormatted(String date) {
      final newDate = DateTime.parse(date.replaceAll('.000', ''));
      return '${newDate.day} de ${DateFormat('MMMM', 'es').format(newDate)} de ${newDate.year}';
    }

    return BenefitModel(
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
      category: json['Category'] == null
          ? Category.empty()
          : CategoryModel.fromJson(
              json['Category'] as Map<String, dynamic>,
            ),
      trade: json['Trade'] == null
          ? Trade.empty()
          : TradeModel.fromJson(
              json['Trade'] as Map<String, dynamic>,
            ),
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
      'category': category,
      'trade': trade,
    };
  }
}

extension BenefitMapper on BenefitModel {
  Benefit toEntity() {
    return Benefit(
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
      category: category,
      trade: trade,
    );
  }
}
