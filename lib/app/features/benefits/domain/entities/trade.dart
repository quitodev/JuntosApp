part of 'entities.dart';

class Trade extends Equatable {
  const Trade({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.url,
    required this.logo,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.productId,
  });

  factory Trade.empty() {
    return Trade(
      id: '',
      name: '',
      email: '',
      phone: '',
      url: '',
      logo: '',
      status: false,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      productId: '',
    );
  }

  Trade copyWith({
    String? id,
    String? name,
    String? email,
    String? phone,
    String? url,
    String? logo,
    bool? status,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? productId,
  }) {
    return Trade(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      url: url ?? this.url,
      logo: logo ?? this.logo,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      productId: productId ?? this.productId,
    );
  }

  final String id;
  final String name;
  final String email;
  final String phone;
  final String url;
  final String logo;
  final bool status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String productId;

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        phone,
        url,
        logo,
        status,
        createdAt,
        updatedAt,
        productId,
      ];
}
