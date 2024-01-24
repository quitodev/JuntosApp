part of 'widgets.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomImageAsset(
      imageUrl: AppImages.background,
      boxFit: BoxFit.fill,
    );
  }
}
