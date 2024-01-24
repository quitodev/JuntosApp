part of 'pages.dart';

class GiveawayDetailPage extends StatelessWidget {
  const GiveawayDetailPage({
    required this.giveaway,
    super.key,
  });

  final Giveaway giveaway;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: theme.colorScheme.background,
      appBar: CustomAppBar(
        title: l10n.giveawaysNav,
      ),
      bottomSheet: CustomBottomSheet(
        text: l10n.participateNow,
        onTap: () {
          context.pushNamed(
            Routes.routeGiveawayInvite.name,
            extra: giveaway,
          );
        },
      ),
      body: _GiveawayDetailContent(
        giveaway: giveaway,
      ),
    );
  }
}

class _GiveawayDetailContent extends StatelessWidget {
  const _GiveawayDetailContent({
    required this.giveaway,
  });

  final Giveaway giveaway;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          GiveawayImage(
            giveaway: giveaway,
          ),
          GiveawayTitle(
            giveaway: giveaway,
          ),
          GiveawayDescription(
            giveaway: giveaway,
          ),
          const SizedBox(
            height: 96,
          ),
        ],
      ),
    );
  }
}
