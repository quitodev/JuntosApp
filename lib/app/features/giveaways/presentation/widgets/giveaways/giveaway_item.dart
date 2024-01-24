part of '../widgets.dart';

class GiveawayItem extends StatelessWidget {
  const GiveawayItem({
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
        height: (1.sw * 0.50) - 16,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: theme.colorScheme.onSurface.withOpacity(0.5),
              spreadRadius: 4,
              blurRadius: 4,
              offset: const Offset(1, 1),
            ),
          ],
        ),
        child: MouseRegion(
          cursor:
              giveaway.status ? SystemMouseCursors.click : MouseCursor.defer,
          child: GestureDetector(
            onTap: giveaway.status
                ? () {
                    context.pushNamed(
                      Routes.routeGiveawayDetail.name,
                      extra: giveaway,
                    );
                  }
                : null,
            child: _GiveawayImage(
              imageUrl: giveaway.banner,
              status: giveaway.status,
            ),
          ),
        ),
      ),
    );
  }
}

class _GiveawayImage extends StatelessWidget {
  const _GiveawayImage({
    required this.imageUrl,
    required this.status,
  });

  final String imageUrl;
  final bool status;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Stack(
      children: [
        CustomImageNetwork(
          imageUrl: imageUrl,
          width: 1.sw,
          height: (1.sw * 0.50) - 16,
          boxFit: BoxFit.cover,
        ),
        if (!status)
          Container(
            color: theme.colorScheme.onBackground.withOpacity(0.7),
            width: 1.sw,
            height: (1.sw * 0.50) - 16,
          ),
      ],
    );
  }
}
