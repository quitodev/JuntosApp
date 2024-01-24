import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:juntos_app/app/core/utils/utils.dart';
import 'package:juntos_app/app/features/board/domain/entities/entities.dart';
import 'package:juntos_app/app/features/board/domain/usecases/usecases.dart';

part 'board_state.dart';

class BoardCubit extends Cubit<BoardState> {
  BoardCubit({
    required GetPosts getPosts,
    required LikePost likePost,
    required DislikePost dislikePost,
  })  : _getPosts = getPosts,
        _likePost = likePost,
        _dislikePost = dislikePost,
        super(
          BoardState(
            status: BoardInitial(),
            posts: List.empty(),
          ),
        );

  final GetPosts _getPosts;
  final LikePost _likePost;
  final DislikePost _dislikePost;

  void _showLoading() {
    emit(
      state.copyWith(
        status: BoardLoading(),
      ),
    );
  }

  void _showError(Failure failure) {
    emit(
      state.copyWith(
        status: BoardError(
          failure.message,
        ),
      ),
    );
    emit(
      state.copyWith(
        status: BoardInitial(),
      ),
    );
  }

  Future<void> getPosts() async {
    _showLoading();
    final either = await _getPosts.call();
    either.fold(
      (failure) => _showError(failure),
      (result) {
        emit(
          state.copyWith(
            status: result.isNotEmpty ? BoardSuccess() : BoardEmpty(),
            posts: result,
          ),
        );
      },
    );
  }

  Future<void> likePost(String postId) async {
    _showLoading();
    final either = await _likePost.call(postId);
    either.fold(
      (failure) => _showError(failure),
      (_) {
        emit(
          state.copyWith(
            status: BoardSuccess(),
          ),
        );
      },
    );
  }

  Future<void> dislikePost(String postId) async {
    _showLoading();
    final either = await _dislikePost.call(postId);
    either.fold(
      (failure) => _showError(failure),
      (_) {
        emit(
          state.copyWith(
            status: BoardSuccess(),
          ),
        );
      },
    );
  }
}
