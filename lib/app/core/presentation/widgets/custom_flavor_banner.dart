part of 'widgets.dart';

class CustomFlavorBanner extends StatelessWidget {
  const CustomFlavorBanner({
    required this.child,
    required this.flavor,
    this.position = BannerLocation.topEnd,
    this.devColor = Colors.amber,
    this.stgColor = Colors.cyan,
    super.key,
  });

  final Flavor flavor;
  final BannerLocation position;
  final Color devColor;
  final Color stgColor;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return flavor == Flavor.production
        ? child
        : Banner(
            message: flavor == Flavor.development
                ? 'DEV'
                : flavor == Flavor.staging
                    ? 'STG'
                    : '',
            location: position,
            color: flavor == Flavor.development
                ? devColor
                : flavor == Flavor.staging
                    ? stgColor
                    : Colors.transparent,
            textDirection: TextDirection.ltr,
            layoutDirection: TextDirection.ltr,
            child: child,
          );
  }
}
