part of '../widgets.dart';

class BenefitModal extends StatelessWidget {
  const BenefitModal({
    required this.benefit,
    required this.onTap,
    super.key,
  });

  final Benefit benefit;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const _BenefitModalTitle(),
            const SizedBox(
              height: 16,
            ),
            _BenefitModalOne(
              provider: benefit.trade.name,
            ),
            const SizedBox(
              height: 16,
            ),
            _BenefitModalCode(
              code: benefit.discountCode,
            ),
            const SizedBox(
              height: 16,
            ),
            const _BenefitModalTwo(),
            const SizedBox(
              height: 16,
            ),
            _BenefitModalThree(
              price: benefit.price,
              discount: benefit.offerPrice,
            ),
            const SizedBox(
              height: 48,
            ),
            CustomContinueButton(
              text: l10n.done,
              onTap: onTap,
            ),
          ],
        ),
      ),
    );
  }
}

class _BenefitModalTitle extends StatelessWidget {
  const _BenefitModalTitle();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    return CustomText(
      text: l10n.finalizeOrder,
      fontSize: 16.spMax,
      fontWeight: FontWeight.bold,
      color: theme.colorScheme.primary,
      textAlign: TextAlign.center,
    );
  }
}

class _BenefitModalOne extends StatelessWidget {
  const _BenefitModalOne({
    required this.provider,
  });

  final String provider;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    return Row(
      children: [
        CustomIcon(
          icon: AppSvg.one,
          size: 40,
          color: theme.colorScheme.primary,
        ),
        const SizedBox(
          width: 8,
        ),
        CustomText(
          text: '${l10n.visitThePlace} $provider ${l10n.showTheDiscountCode}',
          fontSize: 16.spMax,
          color: theme.colorScheme.onBackground,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          width: 1.sw - 80,
        ),
      ],
    );
  }
}

class _BenefitModalCode extends StatelessWidget {
  const _BenefitModalCode({
    required this.code,
  });

  final String code;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ColoredBox(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: CustomText(
          text: code,
          fontSize: 30.spMax,
          color: AppColors.titleAppBar,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}

class _BenefitModalTwo extends StatelessWidget {
  const _BenefitModalTwo();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    return Row(
      children: [
        CustomIcon(
          icon: AppSvg.two,
          size: 40,
          color: theme.colorScheme.primary,
        ),
        const SizedBox(
          width: 8,
        ),
        CustomText(
          text: l10n.payInCashOrCard,
          fontSize: 16.spMax,
          color: theme.colorScheme.onBackground,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          width: 1.sw - 80,
        ),
      ],
    );
  }
}

class _BenefitModalThree extends StatelessWidget {
  const _BenefitModalThree({
    required this.price,
    required this.discount,
  });

  final String price;
  final String discount;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    return Row(
      children: [
        CustomIcon(
          icon: AppSvg.three,
          size: 40,
          color: theme.colorScheme.primary,
        ),
        const SizedBox(
          width: 8,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: '${l10n.amountToPay} $price ${l10n.soles}',
              fontSize: 16.spMax,
              color: theme.colorScheme.onBackground,
              overflow: TextOverflow.ellipsis,
            ),
            CustomText(
              text: '${l10n.discountReceived} $discount ${l10n.soles}',
              fontSize: 16.spMax,
              color: theme.colorScheme.onSurface,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ],
    );
  }
}
