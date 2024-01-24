part of 'widgets.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    required this.notification,
    super.key,
  });

  final entity.Notification notification;

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
          child: Row(
            children: [
              const _NotificationImage(
                imageUrl:
                    '', // TODO(me): Reemplazar cuando esté el logo de la institución
              ),
              const SizedBox(
                width: 4,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const _NotificationTitle(
                        title:
                            'NOTIFICACIÓN', // TODO(me): Reemplazar cuando esté el título
                      ),
                      _NotificationDate(
                        date: notification.createdAt,
                      ),
                    ],
                  ),
                  _NotificationDescription(
                    description: notification.body,
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

class _NotificationImage extends StatelessWidget {
  const _NotificationImage({
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (imageUrl.isNotEmpty) {
      return CustomImageNetwork(
        imageUrl: imageUrl,
        height: 64,
        width: 64,
        boxFit: BoxFit.cover,
      );
    }
    return CustomIcon(
      icon: AppSvg.giveaways,
      color: theme.colorScheme.primary,
      size: 64,
    );
  }
}

class _NotificationTitle extends StatelessWidget {
  const _NotificationTitle({
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return CustomText(
      text: title,
      fontSize: 14.spMax,
      fontWeight: FontWeight.bold,
      color: theme.colorScheme.onBackground,
      maxLines: 50,
      overflow: TextOverflow.ellipsis,
      width: 1.sw - 190,
    );
  }
}

class _NotificationDate extends StatelessWidget {
  const _NotificationDate({
    required this.date,
  });

  final String date;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return CustomText(
      text: date,
      fontSize: 14.spMax,
      color: theme.colorScheme.primary,
      textAlign: TextAlign.right,
    );
  }
}

class _NotificationDescription extends StatelessWidget {
  const _NotificationDescription({
    required this.description,
  });

  final String description;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return CustomText(
      text: description,
      fontSize: 14.spMax,
      color: theme.colorScheme.onBackground,
      maxLines: 50,
      overflow: TextOverflow.ellipsis,
      width: 1.sw - 190,
    );
  }
}
