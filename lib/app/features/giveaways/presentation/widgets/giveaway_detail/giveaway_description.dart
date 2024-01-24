part of '../widgets.dart';

class GiveawayDescription extends StatelessWidget {
  const GiveawayDescription({
    required this.giveaway,
    super.key,
  });

  final Giveaway giveaway;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.onPrimary,
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
              color: theme.colorScheme.shadow,
              spreadRadius: 2,
              blurRadius: 2,
              offset: const Offset(1, 1),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              _GiveawayDetailConditions(
                conditions: giveaway.conditions,
              ),
              const SizedBox(
                height: 16,
              ),
              _GiveawayDetailDate(
                startDate: giveaway.startDate,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _GiveawayDetailConditions extends StatelessWidget {
  const _GiveawayDetailConditions({
    required this.conditions,
  });

  final String conditions;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomIcon(
          icon: AppSvg.edit,
          color: theme.colorScheme.primary,
          size: 32,
        ),
        const SizedBox(
          width: 8,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: l10n.conditionsGiveaway,
              fontSize: 14.spMax,
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.primary,
            ),
            CustomText(
              text: conditions,
              fontSize: 14.spMax,
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.onBackground,
              maxLines: 50,
              overflow: TextOverflow.ellipsis,
              width: 1.sw - 88,
            ),
          ],
        ),
      ],
    );
  }
}

class _GiveawayDetailDate extends StatelessWidget {
  const _GiveawayDetailDate({
    required this.startDate,
  });

  final String startDate;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomIcon(
          icon: AppSvg.timeLeft,
          color: theme.colorScheme.primary,
          size: 32,
        ),
        const SizedBox(
          width: 8,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: l10n.dateGiveaway,
              fontSize: 14.spMax,
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.primary,
            ),
            CustomText(
              text: startDate,
              fontSize: 14.spMax,
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.onBackground,
              maxLines: 50,
              overflow: TextOverflow.ellipsis,
              width: 1.sw - 88,
            ),
          ],
        ),
      ],
    );
  }
}
