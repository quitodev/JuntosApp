part of '../widgets.dart';

class BenefitTitle extends StatelessWidget {
  const BenefitTitle({
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
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _BenefitDetailProvider(
                    provider: benefit.trade.name,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  _BenefitDetailName(
                    name: benefit.productName,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      _BenefitDetailPrice(
                        price: benefit.price,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      _BenefitDetailDiscount(
                        discount: benefit.offerPrice,
                      ),
                    ],
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

class _BenefitDetailProvider extends StatelessWidget {
  const _BenefitDetailProvider({
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

class _BenefitDetailName extends StatelessWidget {
  const _BenefitDetailName({
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

class _BenefitDetailPrice extends StatelessWidget {
  const _BenefitDetailPrice({
    required this.price,
  });

  final String price;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return CustomText(
      text: price,
      fontSize: 30.spMax,
      color: theme.colorScheme.primary,
    );
  }
}

class _BenefitDetailDiscount extends StatelessWidget {
  const _BenefitDetailDiscount({
    required this.discount,
  });

  final String discount;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Text(
      discount,
      style: theme.textTheme.bodyMedium!.copyWith(
        fontWeight: FontWeight.normal,
        fontSize: 14.spMax,
        color: theme.colorScheme.primary,
        decoration: TextDecoration.lineThrough,
        decorationColor: theme.colorScheme.primary,
      ),
      textAlign: TextAlign.left,
    );
  }
}
