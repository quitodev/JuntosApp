part of 'usecases.dart';

class UpdateUser {
  UpdateUser(this.userRepository);

  final IUserRepository userRepository;

  Future<Either<Failure, String>> call(Account account) async {
    return userRepository.updateUser(account);
  }
}
