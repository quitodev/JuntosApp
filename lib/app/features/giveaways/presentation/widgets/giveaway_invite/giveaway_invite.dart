part of '../widgets.dart';

class GiveawayInvite extends StatelessWidget {
  const GiveawayInvite({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.onPrimary,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: theme.colorScheme.shadow,
              spreadRadius: 4,
              blurRadius: 8,
              offset: const Offset(1, 1),
            ),
          ],
        ),
        child: const Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              _InviteImage(),
              SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _InviteTitle(),
                  _InviteDescription(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InviteImage extends StatelessWidget {
  const _InviteImage();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return CustomIcon(
      icon: AppSvg.friends,
      color: theme.colorScheme.primary,
      size: 48,
    );
  }
}

class _InviteTitle extends StatelessWidget {
  const _InviteTitle();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    return CustomText(
      text: l10n.participateGiveaway,
      fontSize: 14.spMax,
      color: theme.colorScheme.primary,
    );
  }
}

class _InviteDescription extends StatelessWidget {
  const _InviteDescription();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    return CustomText(
      text: l10n.shareOurApp,
      fontSize: 20.spMax,
      fontWeight: FontWeight.bold,
      color: theme.colorScheme.onBackground,
      maxLines: 50,
      overflow: TextOverflow.ellipsis,
      width: 1.sw - 120,
    );
  }
}
