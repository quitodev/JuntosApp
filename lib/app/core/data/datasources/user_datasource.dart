part of 'datasources.dart';

abstract class IUserDatasource {
  Future<AccountModel> getUser();
  Future<String> updateUser(AccountModel account);
  Future<String> uploadAvatar(AvatarModel avatar);
  Future<DocumentModel> findDocument(String numberDocument);
  Future<List<DepartmentModel>> getDepartments();
  Future<List<ProvinceModel>> getProvinces(String departmentId);
  Future<List<InstitutionModel>> getInstitutions();
}

class UserDatasource implements IUserDatasource {
  UserDatasource({
    required this.dio,
  });

  final Dio dio;

  @override
  Future<AccountModel> getUser() async {
    if (await AppUtils.userHasInternet()) {
      final response = await dio.get(
        '/auth/me',
      );
      if (response.statusCode == 200) {
        return AccountModel.fromJson(
          response.data as Map<String, dynamic>,
        );
      }
    }
    throw Exception();
  }

  @override
  Future<String> updateUser(AccountModel account) async {
    if (await AppUtils.userHasInternet()) {
      final response = await dio.put(
        '/auth/profile',
        data: account.toJsonProfile(),
      );
      if (response.statusCode == 200) {
        return response.data.toString();
      }
    }
    throw Exception();
  }

  @override
  Future<String> uploadAvatar(AvatarModel avatar) async {
    if (await AppUtils.userHasInternet()) {
      final formData = FormData.fromMap({
        'avatar': await MultipartFile.fromFile(
          avatar.avatar.path,
          filename: avatar.avatar.path.substring(avatar.avatar.path.length - 3),
        ),
        'privateUrl': avatar.privateUrl,
        'filename': avatar.filename,
      });
      final response = await dio.post('/file/upload', data: formData);
      if (response.statusCode == 200) {
        return response.data.toString();
      }
    }
    throw Exception();
  }

  @override
  Future<DocumentModel> findDocument(String numberDocument) async {
    if (await AppUtils.userHasInternet()) {
      final response = await dio.get(
        '/user/dni/$numberDocument',
      );
      if (response.statusCode == 200) {
        return DocumentModel.fromJson(
          response.data as Map<String, dynamic>,
        );
      }
    }
    throw Exception();
  }

  @override
  Future<List<DepartmentModel>> getDepartments() async {
    if (await AppUtils.userHasInternet()) {
      final response = await dio.get(
        '/ubigeo/departamento',
      );
      if (response.statusCode == 200) {
        final data = response.data as List;
        return List<DepartmentModel>.from(
          data.map(DepartmentModel.fromJson).toList(),
        );
      }
    }
    throw Exception();
  }

  @override
  Future<List<ProvinceModel>> getProvinces(String departmentId) async {
    if (await AppUtils.userHasInternet()) {
      final response = await dio.get(
        '/ubigeo/departamento/$departmentId',
      );
      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        return List<ProvinceModel>.from(
          (data['provincia'] as List).map(ProvinceModel.fromJson).toList(),
        );
      }
    }
    throw Exception();
  }

  @override
  Future<List<InstitutionModel>> getInstitutions() async {
    if (await AppUtils.userHasInternet()) {
      final response = await dio.get(
        '/institution/autocomplete',
      );
      if (response.statusCode == 200) {
        final data = response.data as List;
        return List<InstitutionModel>.from(
          data.map(InstitutionModel.fromJson).toList(),
        );
      }
    }
    throw Exception();
  }
}
