part of 'widgets.dart';

class RadioImage extends StatelessWidget {
  const RadioImage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Expanded(
      child: Stack(
        fit: StackFit.expand,
        children: [
          CustomImageAsset(
            imageUrl: AppImages.radio,
            boxFit: BoxFit.cover,
            width: 1.sw,
          ),
          Container(
            color: theme.colorScheme.onPrimary.withOpacity(0.5),
            width: 1.sw,
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  height: 80,
                  width: 80,
                  icon: AppSvg.play,
                  iconSize: 80,
                  iconColor: theme.colorScheme.primary,
                  backgroundColor: theme.colorScheme.onPrimary,
                  borderWidth: 0,
                  radius: 160,
                  onTap: () {},
                ),
                const SizedBox(
                  width: 8,
                ),
                CustomButton(
                  height: 80,
                  width: 80,
                  icon: AppSvg.stop,
                  iconSize: 80,
                  iconColor: theme.colorScheme.primary,
                  backgroundColor: theme.colorScheme.onPrimary,
                  borderWidth: 0,
                  radius: 160,
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
