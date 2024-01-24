part of 'widgets.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    this.title,
    this.image,
    this.paddingLeft,
    this.showBackButton = true,
    super.key,
  });

  final String? title;
  final String? image;
  final double? paddingLeft;
  final bool showBackButton;

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppBar(
      automaticallyImplyLeading: showBackButton,
      backgroundColor: title != null || image != null
          ? theme.colorScheme.primary
          : Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(
        color: theme.colorScheme.onPrimary,
      ),
      systemOverlayStyle: SystemUiOverlayStyle.light,
      title: Padding(
        padding: EdgeInsets.only(
          left: paddingLeft ?? 0,
          right: 56,
        ),
        child: image != null
            ? Center(
                child: CustomImageAsset(
                  imageUrl: image ?? AppImages.appLogo,
                  boxFit: BoxFit.scaleDown,
                  height: 50,
                ),
              )
            : Center(
                child: CustomText(
                  text: title?.toUpperCase() ?? '',
                  color: AppColors.titleAppBar,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.spMax,
                ),
              ),
      ),
    );
  }
}
