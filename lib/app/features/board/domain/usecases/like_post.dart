part of 'usecases.dart';

class LikePost {
  LikePost(this.boardRepository);

  final IBoardRepository boardRepository;

  Future<Either<Failure, String>> call(String postId) async {
    return boardRepository.likePost(postId);
  }
}
