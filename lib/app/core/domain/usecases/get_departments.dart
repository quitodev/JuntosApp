part of 'usecases.dart';

class GetDepartments {
  GetDepartments(this.userRepository);

  final IUserRepository userRepository;

  Future<Either<Failure, List<Department>>> call() async {
    return userRepository.getDepartments();
  }
}
