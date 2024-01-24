part of 'usecases.dart';

class GetInstitutions {
  GetInstitutions(this.userRepository);

  final IUserRepository userRepository;

  Future<Either<Failure, List<Institution>>> call() async {
    return userRepository.getInstitutions();
  }
}
