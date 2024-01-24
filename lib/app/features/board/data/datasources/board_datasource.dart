part of 'datasources.dart';

abstract class IBoardDatasource {
  Future<List<PostModel>> getPosts();
  Future<String> likePost(String postId);
  Future<String> dislikePost(String postId);
}

class BoardDatasource implements IBoardDatasource {
  BoardDatasource({
    required this.dio,
  });

  final Dio dio;

  @override
  Future<List<PostModel>> getPosts() async {
    if (await AppUtils.userHasInternet()) {
      final response = await dio.get(
        '/post',
      );
      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        return List<PostModel>.from(
          (data['rows'] as List).map(PostModel.fromJson).toList(),
        );
      }
    }
    throw Exception();
  }

  @override
  Future<String> likePost(String postId) async {
    if (await AppUtils.userHasInternet()) {
      final response = await dio.put(
        '/xxxxx', // TODO(me): Reemplazar cuando esté el endpoint
        data: {
          'postId': postId,
        },
      );
      if (response.statusCode == 200) {
        return response.data.toString();
      }
    }
    throw Exception();
  }

  @override
  Future<String> dislikePost(String postId) async {
    if (await AppUtils.userHasInternet()) {
      final response = await dio.put(
        '/xxxxx', // TODO(me): Reemplazar cuando esté el endpoint
        data: {
          'postId': postId,
        },
      );
      if (response.statusCode == 200) {
        return response.data.toString();
      }
    }
    throw Exception();
  }
}
