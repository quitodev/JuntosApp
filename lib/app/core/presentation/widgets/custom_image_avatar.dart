part of 'widgets.dart';

class CustomImageAvatar extends StatelessWidget {
  const CustomImageAvatar({
    required this.image,
    required this.radius,
    super.key,
  });

  final String image;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (image.isNotEmpty) {
      return CircleAvatar(
        foregroundImage: NetworkImage(
          Configs.configUrlImages + image,
        ),
        backgroundColor: theme.colorScheme.onPrimary,
        radius: radius,
      );
    }
    return CircleAvatar(
      backgroundColor: theme.colorScheme.onPrimary,
      radius: radius,
      child: Center(
        child: CustomIcon(
          icon: AppSvg.account,
          color: theme.colorScheme.onSurface,
          size: radius + 8,
        ),
      ),
    );
  }
}
