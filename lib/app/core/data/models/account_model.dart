part of 'models.dart';

class AccountModel extends Account {
  const AccountModel({
    required super.fullName,
    required super.firstName,
    required super.lastName,
    required super.address,
    required super.district,
    required super.province,
    required super.department,
    required super.phoneNumber,
    required super.institutionId,
    required super.email,
    required super.password,
    required super.typeDocument,
    required super.numberDocument,
    required super.status,
    required super.emailVerified,
    required super.avatar,
    required super.institution,
  });

  factory AccountModel.fromEntity(Account account) {
    return AccountModel(
      fullName: account.fullName,
      firstName: account.firstName,
      lastName: account.lastName,
      address: account.address,
      district: account.district,
      province: account.province,
      department: account.department,
      phoneNumber: account.phoneNumber,
      institutionId: account.institutionId,
      email: account.email,
      password: account.password,
      typeDocument: account.typeDocument,
      numberDocument: account.numberDocument,
      status: account.status,
      emailVerified: account.emailVerified,
      avatar: account.avatar,
      institution: account.institution,
    );
  }

  factory AccountModel.fromJson(dynamic json) {
    return AccountModel(
      fullName: json['fullName'] == null ? '' : json['fullName'] as String,
      firstName: json['firstName'] == null ? '' : json['firstName'] as String,
      lastName: json['lastName'] == null ? '' : json['lastName'] as String,
      address: json['address'] == null ? '' : json['address'] as String,
      district: json['district'] == null ? '' : json['district'] as String,
      province: json['province'] == null ? '' : json['province'] as String,
      department:
          json['department'] == null ? '' : json['department'] as String,
      phoneNumber: json['phone'] == null ? '' : json['phone'] as String,
      institutionId:
          json['institutionId'] == null ? '' : json['institutionId'] as String,
      email: json['email'] == null ? '' : json['email'] as String,
      password: json['password'] == null ? '' : json['password'] as String,
      typeDocument:
          json['typeDocument'] == null ? '' : json['typeDocument'] as String,
      numberDocument: json['numberDocument'] == null
          ? ''
          : json['numberDocument'] as String,
      status: json['status'] == null ? false : json['status'] as bool,
      emailVerified:
          json['emailVerified'] == null ? false : json['emailVerified'] as bool,
      avatar: json['avatar'] == null ? '' : json['avatar'] as String,
      institution: json['Institution'] == null
          ? Institution.empty()
          : InstitutionModel.fromJson(
              json['Institution'] as Map<String, dynamic>,
            ),
    );
  }

  Map<String, dynamic> toJsonRegistration() {
    return {
      'fullName': fullName,
      'firstName': firstName,
      'lastName': lastName,
      'address': address,
      'phoneNumber': phoneNumber,
      'district': district,
      'province': province,
      'department': department,
      'institution': institutionId,
      'email': email,
      'password': password,
      'typeDocument': typeDocument,
      'numberDocument': numberDocument,
    };
  }

  Map<String, dynamic> toJsonProfile() {
    return {
      'data': {
        'fullName': fullName,
        'firstName': firstName,
        'lastName': lastName,
        'address': address,
        'district': district,
        'province': province,
        'department': department,
        'phoneNumber': phoneNumber,
        'institution': institutionId,
        'email': email,
        'password': password,
        'typeDocument': typeDocument,
        'numberDocument': numberDocument,
        'avatar': avatar,
      },
    };
  }
}

extension AccountMapper on AccountModel {
  Account toEntity() {
    return Account(
      fullName: fullName,
      firstName: firstName,
      lastName: lastName,
      address: address,
      district: district,
      province: province,
      department: department,
      phoneNumber: phoneNumber,
      institutionId: institutionId,
      email: email,
      password: password,
      typeDocument: typeDocument,
      numberDocument: numberDocument,
      status: status,
      emailVerified: emailVerified,
      avatar: avatar,
      institution: institution,
    );
  }
}
