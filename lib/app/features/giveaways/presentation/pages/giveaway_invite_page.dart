part of 'pages.dart';

class GiveawayInvitePage extends StatelessWidget {
  const GiveawayInvitePage({
    required this.giveaway,
    super.key,
  });

  final Giveaway giveaway;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    return BlocProvider(
      create: (_) => GiveawayInviteCubit(
        giveawayShared: getIt<GiveawayShared>(),
      )..setGiveaway(giveaway),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: theme.colorScheme.background,
        appBar: CustomAppBar(
          title: l10n.inviteFriends,
        ),
        bottomSheet: BlocBuilder<GiveawayInviteCubit, GiveawayInviteState>(
          builder: (context, state) {
            return CustomBottomSheet(
              text: l10n.inviteFriends,
              onTap: () {
                context.read<GiveawayInviteCubit>().giveawayShared();
              },
            );
          },
        ),
        body: BlocConsumer<GiveawayInviteCubit, GiveawayInviteState>(
          listener: (context, state) {
            if (state.status is GiveawayInviteInitial) {
              AppUtils.shareApp();
            }
            if (state.status is GiveawayInviteError) {
              AppUtils.showSnackbar(
                context,
                (state.status as GiveawayInviteError).text,
              );
            }
          },
          builder: (context, state) {
            if (state.status is GiveawayInviteInitial) {
              return const _GiveawayInviteContent();
            }
            return const CustomProgress();
          },
        ),
      ),
    );
  }
}

class _GiveawayInviteContent extends StatelessWidget {
  const _GiveawayInviteContent();

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          GiveawayInvite(),
          SizedBox(
            height: 96,
          ),
        ],
      ),
    );
  }
}
