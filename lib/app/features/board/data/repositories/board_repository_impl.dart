part of 'repositories_impl.dart';

class BoardRepositoryImpl implements IBoardRepository {
  BoardRepositoryImpl(this.boardDatasource);

  final IBoardDatasource boardDatasource;

  @override
  Future<Either<Failure, List<Post>>> getPosts() async {
    try {
      return Right(
        await boardDatasource.getPosts(),
      );
    } on DioException catch (error) {
      log(
        '$error ${error.response?.data}',
        name: Repositories.repositoryBoard,
      );
      return Left(
        Failure(
          error.response != null && error.response!.statusCode == 400
              ? error.response!.data.toString()
              : Errors.errorNetwork,
        ),
      );
    } catch (error) {
      log(error.toString(), name: Repositories.repositoryBoard);
      return const Left(
        Failure(Errors.errorNetwork),
      );
    }
  }

  @override
  Future<Either<Failure, String>> likePost(String postId) async {
    try {
      return Right(
        await boardDatasource.likePost(postId),
      );
    } on DioException catch (error) {
      log(
        '$error ${error.response?.data}',
        name: Repositories.repositoryBoard,
      );
      return Left(
        Failure(
          error.response != null && error.response!.statusCode == 400
              ? error.response!.data.toString()
              : Errors.errorNetwork,
        ),
      );
    } catch (error) {
      log(error.toString(), name: Repositories.repositoryBoard);
      return const Left(
        Failure(Errors.errorNetwork),
      );
    }
  }

  @override
  Future<Either<Failure, String>> dislikePost(String postId) async {
    try {
      return Right(
        await boardDatasource.dislikePost(postId),
      );
    } on DioException catch (error) {
      log(
        '$error ${error.response?.data}',
        name: Repositories.repositoryBoard,
      );
      return Left(
        Failure(
          error.response != null && error.response!.statusCode == 400
              ? error.response!.data.toString()
              : Errors.errorNetwork,
        ),
      );
    } catch (error) {
      log(error.toString(), name: Repositories.repositoryBoard);
      return const Left(
        Failure(Errors.errorNetwork),
      );
    }
  }
}
