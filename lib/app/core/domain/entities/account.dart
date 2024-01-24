part of 'entities.dart';

class Account extends Equatable {
  const Account({
    required this.fullName,
    required this.firstName,
    required this.lastName,
    required this.address,
    required this.district,
    required this.province,
    required this.department,
    required this.phoneNumber,
    required this.institutionId,
    required this.email,
    required this.password,
    required this.typeDocument,
    required this.numberDocument,
    required this.status,
    required this.emailVerified,
    required this.avatar,
    required this.institution,
  });

  factory Account.empty() {
    return Account(
      fullName: '',
      firstName: '',
      lastName: '',
      address: '',
      district: '',
      province: '',
      department: '',
      phoneNumber: '',
      institutionId: '',
      email: '',
      password: '',
      typeDocument: Configs.configCarnet[0],
      numberDocument: '',
      status: false,
      emailVerified: false,
      avatar: '',
      institution: Institution.empty(),
    );
  }

  Account copyWith({
    String? fullName,
    String? firstName,
    String? lastName,
    String? address,
    String? district,
    String? province,
    String? department,
    String? phoneNumber,
    String? institutionId,
    String? email,
    String? password,
    String? typeDocument,
    String? numberDocument,
    bool? status,
    bool? emailVerified,
    String? avatar,
    Institution? institution,
  }) {
    return Account(
      fullName: fullName ?? this.fullName,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      address: address ?? this.address,
      district: district ?? this.district,
      province: province ?? this.province,
      department: department ?? this.department,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      institutionId: institutionId ?? this.institutionId,
      email: email ?? this.email,
      password: password ?? this.password,
      typeDocument: typeDocument ?? this.typeDocument,
      numberDocument: numberDocument ?? this.numberDocument,
      status: status ?? this.status,
      emailVerified: emailVerified ?? this.emailVerified,
      avatar: avatar ?? this.avatar,
      institution: institution ?? this.institution,
    );
  }

  final String fullName;
  final String firstName;
  final String lastName;
  final String address;
  final String district;
  final String province;
  final String department;
  final String phoneNumber;
  final String institutionId;
  final String email;
  final String password;
  final String typeDocument;
  final String numberDocument;
  final bool status;
  final bool emailVerified;
  final String avatar;
  final Institution institution;

  @override
  List<Object?> get props => [
        fullName,
        firstName,
        lastName,
        address,
        district,
        province,
        department,
        phoneNumber,
        institutionId,
        email,
        password,
        typeDocument,
        numberDocument,
        status,
        emailVerified,
        avatar,
        institution,
      ];
}
