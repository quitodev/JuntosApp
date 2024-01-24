part of '../widgets.dart';

class BenefitDescription extends StatelessWidget {
  const BenefitDescription({
    required this.benefit,
    super.key,
  });

  final Benefit benefit;

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
              _BenefitDetailInfo(
                info: benefit.description,
              ),
              const SizedBox(
                height: 16,
              ),
              _BenefitDetailLife(
                startDate: benefit.startDate,
                periodEnd: benefit.periodEnd,
              ),
              const SizedBox(
                height: 16,
              ),
              _BenefitDetailStock(
                stock: benefit.stock,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BenefitDetailInfo extends StatelessWidget {
  const _BenefitDetailInfo({
    required this.info,
  });

  final String info;

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
              text: l10n.offerDescription,
              fontSize: 14.spMax,
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.primary,
            ),
            CustomText(
              text: info,
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

class _BenefitDetailLife extends StatelessWidget {
  const _BenefitDetailLife({
    required this.startDate,
    required this.periodEnd,
  });

  final String startDate;
  final String periodEnd;

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
              text: l10n.offerLife,
              fontSize: 14.spMax,
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.primary,
            ),
            CustomText(
              text: '$startDate al $periodEnd',
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

class _BenefitDetailStock extends StatelessWidget {
  const _BenefitDetailStock({
    required this.stock,
  });

  final int stock;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomIcon(
          icon: AppSvg.stock,
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
              text: l10n.stock,
              fontSize: 14.spMax,
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.primary,
            ),
            CustomText(
              text: stock == 1 ? '$stock promoción' : '$stock promociones',
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
