part of 'pages.dart';

class BoardPage extends StatelessWidget {
  const BoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BoardCubit(
        getPosts: getIt<GetPosts>(),
        likePost: getIt<LikePost>(),
        dislikePost: getIt<DislikePost>(),
      )..getPosts(),
      child: BlocConsumer<BoardCubit, BoardState>(
        listener: (context, state) {
          if (state.status is BoardError) {
            AppUtils.showSnackbar(
              context,
              (state.status as BoardError).text,
            );
          }
        },
        builder: (context, state) {
          if (state.status is BoardSuccess) {
            return const _BoardContent();
          }
          if (state.status is BoardEmpty) {
            return const CustomEmpty();
          }
          return const CustomProgress();
        },
      ),
    );
  }
}

class _BoardContent extends StatelessWidget {
  const _BoardContent();

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          BannersCarousel(),
          PostsList(),
          SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}
