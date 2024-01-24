part of '../widgets.dart';

class GiveawayTitle extends StatelessWidget {
  const GiveawayTitle({
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
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const _GiveawayDetailProvider(
                    provider:
                        'COMERCIO', // TODO(me): Reemplazar cuando esté el nombre del comercio
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  _GiveawayDetailName(
                    name: giveaway.name,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _GiveawayDetailProvider extends StatelessWidget {
  const _GiveawayDetailProvider({
    required this.provider,
  });

  final String provider;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    return SizedBox(
      width: 1.sw - 48,
      child: Text.rich(
        TextSpan(
          text: l10n.offeredBy,
          style: theme.textTheme.bodyMedium!.copyWith(
            fontSize: 14.spMax,
            color: theme.colorScheme.primary,
          ),
          children: [
            TextSpan(
              text: provider,
              style: theme.textTheme.bodyMedium!.copyWith(
                fontSize: 14.spMax,
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.primary,
              ),
            ),
          ],
        ),
        maxLines: 50,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class _GiveawayDetailName extends StatelessWidget {
  const _GiveawayDetailName({
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return CustomText(
      text: name,
      fontSize: 20.spMax,
      fontWeight: FontWeight.bold,
      color: theme.colorScheme.onBackground,
      maxLines: 50,
      overflow: TextOverflow.ellipsis,
      width: 1.sw - 48,
    );
  }
}
