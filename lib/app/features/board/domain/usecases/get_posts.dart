part of 'usecases.dart';

class GetPosts {
  GetPosts(this.boardRepository);

  final IBoardRepository boardRepository;

  Future<Either<Failure, List<Post>>> call() async {
    return boardRepository.getPosts();
  }
}
