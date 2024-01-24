part of 'usecases.dart';

class GetProvinces {
  GetProvinces(this.userRepository);

  final IUserRepository userRepository;

  Future<Either<Failure, List<Province>>> call(String departmentId) async {
    return userRepository.getProvinces(departmentId);
  }
}
