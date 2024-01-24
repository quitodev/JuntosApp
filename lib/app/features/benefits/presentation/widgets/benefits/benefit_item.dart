part of '../widgets.dart';

class BenefitItem extends StatelessWidget {
  const BenefitItem({
    required this.benefit,
    super.key,
  });

  final Benefit benefit;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            context.pushNamed(
              Routes.routeBenefitDetail.name,
              extra: benefit,
            );
          },
          child: Container(
            decoration: BoxDecoration(
              color: theme.colorScheme.onPrimary,
              boxShadow: [
                BoxShadow(
                  color: theme.colorScheme.shadow,
                  spreadRadius: 4,
                  blurRadius: 4,
                  offset: const Offset(1, 1),
                ),
              ],
            ),
            child: Column(
              children: [
                _BenefitImage(
                  imageUrl: benefit
                      .photo, // TODO(me): Reemplazar cuando esté la imagen de listado
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _BenefitName(
                              name: benefit.productName,
                            ),
                            _BenefitPrice(
                              price: benefit.price,
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 1,
                              width: 200 - 16,
                              color: AppColors.itemDrawerDivider,
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            _BenefitPlace(
                              place: benefit.trade.name,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _BenefitImage extends StatelessWidget {
  const _BenefitImage({
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CustomImageNetwork(
      imageUrl: imageUrl,
      height: 100,
      width: 200,
      boxFit: BoxFit.cover,
    );
  }
}

class _BenefitName extends StatelessWidget {
  const _BenefitName({
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
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      width: 200 - 16,
    );
  }
}

class _BenefitPrice extends StatelessWidget {
  const _BenefitPrice({
    required this.price,
  });

  final String price;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return CustomText(
      text: price,
      fontSize: 18.spMax,
      fontWeight: FontWeight.bold,
      color: theme.colorScheme.onBackground,
      overflow: TextOverflow.ellipsis,
      width: 200 - 16,
    );
  }
}

class _BenefitPlace extends StatelessWidget {
  const _BenefitPlace({
    required this.place,
  });

  final String place;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        CustomIcon(
          icon: AppSvg.restaurant,
          size: 14,
          color: theme.colorScheme.onSurface,
        ),
        const SizedBox(
          width: 8,
        ),
        CustomText(
          text: place,
          fontSize: 12.spMax,
          fontWeight: FontWeight.bold,
          color: theme.colorScheme.onSurface,
          overflow: TextOverflow.ellipsis,
          width: 200 - 40,
        ),
      ],
    );
  }
}
