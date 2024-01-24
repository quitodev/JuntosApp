part of 'usecases.dart';

class DislikePost {
  DislikePost(this.boardRepository);

  final IBoardRepository boardRepository;

  Future<Either<Failure, String>> call(String postId) async {
    return boardRepository.dislikePost(postId);
  }
}
