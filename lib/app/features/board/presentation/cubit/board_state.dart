part of 'board_cubit.dart';

class BoardState extends Equatable {
  const BoardState({
    required this.status,
    required this.posts,
  });

  final BoardStatus status;
  final List<Post> posts;

  BoardState copyWith({
    BoardStatus? status,
    List<Post>? posts,
  }) {
    return BoardState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
    );
  }

  @override
  List<Object> get props => [
        status,
        posts,
      ];
}

abstract class BoardStatus {}

class BoardInitial extends BoardStatus {}

class BoardLoading extends BoardStatus {}

class BoardSuccess extends BoardStatus {}

class BoardEmpty extends BoardStatus {}

class BoardError extends BoardStatus {
  BoardError(this.text);

  final String text;
}
