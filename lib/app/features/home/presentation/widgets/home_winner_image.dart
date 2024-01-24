part of 'widgets.dart';

class HomeWinnerImage extends StatelessWidget {
  const HomeWinnerImage({
    required this.imageUrl,
    required this.onTap,
    super.key,
  });

  final String imageUrl;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Stack(
      children: [
        Container(
          height: 1.sh,
          width: 1.sw,
          color: theme.colorScheme.onBackground.withOpacity(0.9),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: CustomImageNetwork(
              imageUrl: imageUrl,
              boxFit: BoxFit.fitWidth,
            ),
          ),
        ),
        Positioned(
          right: 8,
          top: 70,
          child: CustomButton(
            height: 32,
            width: 32,
            backgroundColor: AppColors.itemDrawerDivider,
            icon: AppSvg.exit,
            iconSize: 28,
            iconColor: Colors.black,
            radius: 64,
            borderWidth: 0,
            blurRadius: 100,
            onTap: onTap,
          ),
        ),
      ],
    );
  }
}
