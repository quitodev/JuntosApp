part of 'usecases.dart';

class GetUser {
  GetUser(this.userRepository);

  final IUserRepository userRepository;

  Future<Either<Failure, Account>> call() async {
    return userRepository.getUser();
  }
}
