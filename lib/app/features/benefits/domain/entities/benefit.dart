part of 'entities.dart';

class Benefit extends Equatable {
  const Benefit({
    required this.id,
    required this.productName,
    required this.discountCode,
    required this.description,
    required this.price,
    required this.offerPrice,
    required this.startDate,
    required this.periodEnd,
    required this.stock,
    required this.photo,
    required this.status,
    required this.tradeId,
    required this.categoryId,
    required this.createdAt,
    required this.updatedAt,
    required this.category,
    required this.trade,
  });

  factory Benefit.empty() {
    return Benefit(
      id: '',
      productName: '',
      discountCode: '',
      description: '',
      price: '',
      offerPrice: '',
      startDate: '',
      periodEnd: '',
      stock: 0,
      photo: '',
      status: false,
      tradeId: '',
      categoryId: '',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      category: Category.empty(),
      trade: Trade.empty(),
    );
  }

  Benefit copyWith({
    String? id,
    String? productName,
    String? discountCode,
    String? description,
    String? price,
    String? offerPrice,
    String? startDate,
    String? periodEnd,
    int? stock,
    String? photo,
    bool? status,
    String? tradeId,
    String? categoryId,
    DateTime? createdAt,
    DateTime? updatedAt,
    Category? category,
    Trade? trade,
  }) {
    return Benefit(
      id: id ?? this.id,
      productName: productName ?? this.productName,
      discountCode: discountCode ?? this.discountCode,
      description: description ?? this.description,
      price: price ?? this.price,
      offerPrice: offerPrice ?? this.offerPrice,
      startDate: startDate ?? this.startDate,
      periodEnd: periodEnd ?? this.periodEnd,
      stock: stock ?? this.stock,
      photo: photo ?? this.photo,
      status: status ?? this.status,
      tradeId: tradeId ?? this.tradeId,
      categoryId: categoryId ?? this.categoryId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      category: category ?? this.category,
      trade: trade ?? this.trade,
    );
  }

  final String id;
  final String productName;
  final String discountCode;
  final String description;
  final String price;
  final String offerPrice;
  final String startDate;
  final String periodEnd;
  final int stock;
  final String photo;
  final bool status;
  final String tradeId;
  final String categoryId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Category category;
  final Trade trade;

  @override
  List<Object?> get props => [
        id,
        productName,
        discountCode,
        description,
        price,
        offerPrice,
        startDate,
        periodEnd,
        stock,
        photo,
        status,
        tradeId,
        categoryId,
        createdAt,
        updatedAt,
        category,
        trade,
      ];
}
