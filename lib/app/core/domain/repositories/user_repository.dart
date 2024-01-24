part of 'repositories.dart';

abstract class IUserRepository {
  Future<Either<Failure, Account>> getUser();
  Future<Either<Failure, String>> updateUser(Account account);
  Future<Either<Failure, String>> uploadAvatar(Avatar avatar);
  Future<Either<Failure, Document>> findDocument(String numberDocument);
  Future<Either<Failure, List<Department>>> getDepartments();
  Future<Either<Failure, List<Province>>> getProvinces(String departmentId);
  Future<Either<Failure, List<Institution>>> getInstitutions();
}
