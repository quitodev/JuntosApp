part of 'entities.dart';

class Document extends Equatable {
  const Document({
    required this.number,
    required this.names,
    required this.firstName,
    required this.lastName,
    required this.fullName,
    required this.verificationCode,
    required this.address,
    required this.fullAddress,
    required this.ubigeo,
  });

  factory Document.empty() {
    return Document(
      number: '',
      names: '',
      firstName: '',
      lastName: '',
      fullName: '',
      verificationCode: 0,
      address: '',
      fullAddress: '',
      ubigeo: List.empty(),
    );
  }

  Document copyWith({
    String? number,
    String? names,
    String? firstName,
    String? lastName,
    String? fullName,
    int? verificationCode,
    String? address,
    String? fullAddress,
    List<String>? ubigeo,
  }) {
    return Document(
      number: number ?? this.number,
      names: names ?? this.names,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      fullName: fullName ?? this.fullName,
      verificationCode: verificationCode ?? this.verificationCode,
      address: address ?? this.address,
      fullAddress: fullAddress ?? this.fullAddress,
      ubigeo: ubigeo ?? this.ubigeo,
    );
  }

  final String number;
  final String names;
  final String firstName;
  final String lastName;
  final String fullName;
  final int verificationCode;
  final String address;
  final String fullAddress;
  final List<String> ubigeo;

  @override
  List<Object?> get props => [
        number,
        names,
        firstName,
        lastName,
        fullName,
        verificationCode,
        address,
        fullAddress,
        ubigeo,
      ];
}
