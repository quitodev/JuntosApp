part of 'models.dart';

class DocumentModel extends Document {
  const DocumentModel({
    required super.number,
    required super.names,
    required super.firstName,
    required super.lastName,
    required super.fullName,
    required super.verificationCode,
    required super.address,
    required super.fullAddress,
    required super.ubigeo,
  });

  factory DocumentModel.fromEntity(Document document) {
    return DocumentModel(
      number: document.number,
      names: document.names,
      firstName: document.firstName,
      lastName: document.lastName,
      fullName: document.fullName,
      verificationCode: document.verificationCode,
      address: document.address,
      fullAddress: document.fullAddress,
      ubigeo: document.ubigeo,
    );
  }

  factory DocumentModel.fromJson(dynamic json) {
    return DocumentModel(
      number: json['numero'] == null ? '' : json['numero'] as String,
      names: json['nombres'] == null ? '' : json['nombres'] as String,
      firstName: json['apellido_paterno'] == null
          ? ''
          : json['apellido_paterno'] as String,
      lastName: json['apellido_materno'] == null
          ? ''
          : json['apellido_materno'] as String,
      fullName: json['nombre_completo'] == null
          ? ''
          : json['nombre_completo'] as String,
      verificationCode: json['codigo_verificacion'] == null
          ? 0
          : json['codigo_verificacion'] as int,
      address: json['direccion'] == null ? '' : json['direccion'] as String,
      fullAddress: json['direccion_completa'] == null
          ? ''
          : json['direccion_completa'] as String,
      ubigeo: json['ubigeo'] == null
          ? List.empty()
          : List.from(
              (json['ubigeo'] as List).map((e) => e as String),
            ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'numero': number,
      'nombres': names,
      'apellido_paterno': firstName,
      'apellido_materno': lastName,
      'nombre_completo': fullName,
      'codigo_verificacion': verificationCode,
      'direccion': address,
      'direccion_completa': fullAddress,
      'ubigeo': ubigeo,
    };
  }
}

extension DocumentMapper on DocumentModel {
  Document toEntity() {
    return Document(
      number: number,
      names: names,
      firstName: firstName,
      lastName: lastName,
      fullName: fullName,
      verificationCode: verificationCode,
      address: address,
      fullAddress: fullAddress,
      ubigeo: ubigeo,
    );
  }
}
