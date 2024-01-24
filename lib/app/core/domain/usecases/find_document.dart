part of 'usecases.dart';

class FindDocument {
  FindDocument(this.userRepository);

  final IUserRepository userRepository;

  Future<Either<Failure, Document>> call(String numberDocument) async {
    return userRepository.findDocument(numberDocument);
  }
}
