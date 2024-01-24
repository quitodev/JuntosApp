part of 'repositories.dart';

abstract class IBoardRepository {
  Future<Either<Failure, List<Post>>> getPosts();
  Future<Either<Failure, String>> likePost(String postId);
  Future<Either<Failure, String>> dislikePost(String postId);
}
