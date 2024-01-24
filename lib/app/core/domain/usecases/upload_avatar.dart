part of 'usecases.dart';

class UploadAvatar {
  UploadAvatar(this.userRepository);

  final IUserRepository userRepository;

  Future<Either<Failure, String>> call(Avatar avatar) async {
    return userRepository.uploadAvatar(avatar);
  }
}
