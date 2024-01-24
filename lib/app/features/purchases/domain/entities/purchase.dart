part of 'entities.dart';

class Purchase extends Equatable {
  const Purchase({
    required this.id,
    required this.productId,
    required this.pricePayment,
    required this.paymentMethod,
    required this.userId,
    required this.link,
    required this.createdAt,
    required this.updatedAt,
    required this.product,
  });

  factory Purchase.empty() {
    return Purchase(
      id: '',
      productId: '',
      pricePayment: '',
      paymentMethod: '',
      userId: '',
      link: '',
      createdAt: '',
      updatedAt: DateTime.now(),
      product: Product.empty(),
    );
  }

  Purchase copyWith({
    String? id,
    String? productId,
    String? pricePayment,
    String? paymentMethod,
    String? userId,
    String? link,
    String? createdAt,
    DateTime? updatedAt,
    Product? product,
  }) {
    return Purchase(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      pricePayment: pricePayment ?? this.pricePayment,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      userId: userId ?? this.userId,
      link: link ?? this.link,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      product: product ?? this.product,
    );
  }

  final String id;
  final String productId;
  final String pricePayment;
  final String paymentMethod;
  final String userId;
  final String link;
  final String createdAt;
  final DateTime updatedAt;
  final Product product;

  @override
  List<Object?> get props => [
        id,
        productId,
        pricePayment,
        paymentMethod,
        userId,
        link,
        createdAt,
        updatedAt,
        product,
      ];
}
