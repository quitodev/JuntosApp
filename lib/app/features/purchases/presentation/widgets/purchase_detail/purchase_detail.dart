part of '../widgets.dart';

class PurchaseDetail extends StatelessWidget {
  const PurchaseDetail({
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
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _PurchaseDetailSubtitle(),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _PurchaseDetailProducts(
                    products: purchase.product.description,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  _PurchaseDetailIcon(
                    linkPdf: purchase.link,
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
              _PurchaseDetailButtons(
                price: purchase.product.price,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PurchaseDetailSubtitle extends StatelessWidget {
  const _PurchaseDetailSubtitle();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    return CustomText(
      text: l10n.purchaseDetail,
      fontSize: 14.spMax,
      fontWeight: FontWeight.bold,
      color: theme.colorScheme.onBackground,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      width: 1.sw - 200,
    );
  }
}

class _PurchaseDetailProducts extends StatelessWidget {
  const _PurchaseDetailProducts({
    required this.products,
  });

  final String products;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return CustomText(
      text: products,
      fontSize: 14.spMax,
      color: theme.colorScheme.onBackground,
      maxLines: 50,
      overflow: TextOverflow.ellipsis,
      width: 1.sw - 160,
    );
  }
}

class _PurchaseDetailIcon extends StatelessWidget {
  const _PurchaseDetailIcon({
    required this.linkPdf,
  });

  final String linkPdf;

  @override
  Widget build(BuildContext context) {
    return CustomIcon(
      icon: AppSvg.pdf,
      size: 80,
      onTap: () async {
        await AppUtils.openUrl(linkPdf);
      },
    );
  }
}

class _PurchaseDetailButtons extends StatelessWidget {
  const _PurchaseDetailButtons({
    required this.price,
  });

  final String price;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    return Row(
      children: [
        Expanded(
          child: CustomText(
            text: price,
            fontSize: 14.spMax,
            color: theme.colorScheme.onBackground,
            textAlign: TextAlign.center,
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
      ],
    );
  }
}
