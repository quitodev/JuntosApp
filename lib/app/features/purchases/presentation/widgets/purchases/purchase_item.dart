part of '../widgets.dart';

class PurchaseItem extends StatelessWidget {
  const PurchaseItem({
    required this.purchase,
    super.key,
  });

  final Purchase purchase;

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
              spreadRadius: 4,
              blurRadius: 8,
              offset: const Offset(1, 1),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _PurchaseImage(
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
                          _PurchaseName(
                            name: purchase.product.productName,
                          ),
                          _PurchaseDate(
                            date: purchase.createdAt,
                          ),
                        ],
                      ),
                      _PurchasePrice(
                        price: purchase.product.price,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                height: 1,
                color: AppColors.itemDrawerDivider,
              ),
              const SizedBox(
                height: 8,
              ),
              _PurchaseButtons(
                purchase: purchase,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PurchaseImage extends StatelessWidget {
  const _PurchaseImage({
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

class _PurchaseName extends StatelessWidget {
  const _PurchaseName({
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

class _PurchaseDate extends StatelessWidget {
  const _PurchaseDate({
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

class _PurchasePrice extends StatelessWidget {
  const _PurchasePrice({
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

class _PurchaseButtons extends StatelessWidget {
  const _PurchaseButtons({
    required this.purchase,
  });

  final Purchase purchase;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    return Row(
      children: [
        Expanded(
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () async {
                await AppUtils.openUrl(Configs.configHelp);
              },
              child: CustomText(
                text: l10n.helpOrSupport,
                fontSize: 14.spMax,
                color: theme.colorScheme.onSurface,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        Container(
          width: 1,
          height: 32,
          color: AppColors.itemDrawerDivider,
        ),
        Expanded(
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                context.goNamed(
                  Routes.routePurchaseDetail.name,
                  extra: purchase,
                );
              },
              child: CustomText(
                text: l10n.seeDetail,
                fontSize: 14.spMax,
                color: theme.colorScheme.primary,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
