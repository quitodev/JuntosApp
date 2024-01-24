part of '../widgets.dart';

class PurchasePayment extends StatelessWidget {
  const PurchasePayment({
    required this.purchase,
    super.key,
  });

  final Purchase purchase;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.onPrimary,
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
              color: theme.colorScheme.shadow,
              spreadRadius: 4,
              blurRadius: 8,
              offset: const Offset(1, 1),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _PurchaseDetailImage(
                imageUrl: purchase.product.photo,
              ),
              const SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _PurchaseDetailName(
                        name: purchase.product.productName,
                      ),
                      _PurchaseDetailDate(
                        date: purchase.createdAt,
                      ),
                    ],
                  ),
                  _PurchaseDetailPrice(
                    price: purchase.product.price,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const _PurchaseDetailPayment(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PurchaseDetailImage extends StatelessWidget {
  const _PurchaseDetailImage({
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CustomImageNetwork(
      imageUrl: imageUrl,
      height: 64,
      width: 64,
      boxFit: BoxFit.scaleDown,
    );
  }
}

class _PurchaseDetailName extends StatelessWidget {
  const _PurchaseDetailName({
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return CustomText(
      text: name,
      fontSize: 14.spMax,
      fontWeight: FontWeight.bold,
      color: theme.colorScheme.onBackground,
      maxLines: 50,
      overflow: TextOverflow.ellipsis,
      width: 1.sw - 200,
    );
  }
}

class _PurchaseDetailDate extends StatelessWidget {
  const _PurchaseDetailDate({
    required this.date,
  });

  final String date;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return CustomText(
      text: date,
      fontSize: 14.spMax,
      fontWeight: FontWeight.bold,
      color: theme.colorScheme.onSurface,
      textAlign: TextAlign.right,
    );
  }
}

class _PurchaseDetailPrice extends StatelessWidget {
  const _PurchaseDetailPrice({
    required this.price,
  });

  final String price;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return CustomText(
      text: price,
      fontSize: 14.spMax,
      color: theme.colorScheme.onBackground,
    );
  }
}

class _PurchaseDetailPayment extends StatelessWidget {
  const _PurchaseDetailPayment();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    return Row(
      children: [
        CustomText(
          text: l10n.paymentMethod,
          fontSize: 14.spMax,
          fontWeight: FontWeight.bold,
          color: theme.colorScheme.onBackground,
        ),
        const SizedBox(
          width: 8,
        ),
        CustomText(
          text: l10n.offerExchange,
          fontSize: 14.spMax,
          color: theme.colorScheme.onBackground,
          maxLines: 50,
          overflow: TextOverflow.ellipsis,
          width: 1.sw - 240,
        ),
      ],
    );
  }
}
