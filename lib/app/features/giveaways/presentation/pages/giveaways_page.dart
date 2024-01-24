part of 'pages.dart';

class GiveawaysPage extends StatelessWidget {
  const GiveawaysPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GiveawaysCubit(
        getGiveaways: getIt<GetGiveaways>(),
      )..getGiveaways(),
      child: BlocConsumer<GiveawaysCubit, GiveawaysState>(
        listener: (context, state) {
          if (state.status is GiveawaysError) {
            AppUtils.showSnackbar(
              context,
              (state.status as GiveawaysError).text,
            );
          }
        },
        builder: (context, state) {
          if (state.status is GiveawaysSuccess) {
            return const _GiveawaysContent();
          }
          if (state.status is GiveawaysEmpty) {
            return const CustomEmpty();
          }
          return const CustomProgress();
        },
      ),
    );
  }
}

class _GiveawaysContent extends StatelessWidget {
  const _GiveawaysContent();

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          BannersCarousel(),
          GiveawaysList(),
          SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}
