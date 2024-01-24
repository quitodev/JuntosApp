part of 'widgets.dart';

class CustomImageLogo extends StatelessWidget {
  const CustomImageLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomImageAsset(
      imageUrl: AppImages.appLogo,
      boxFit: BoxFit.scaleDown,
      height: 1.sh - 0.6.sh,
      width: 1.sw - 50,
    );
  }
}
