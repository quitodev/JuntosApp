part of 'widgets.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppBar(
      backgroundColor: theme.colorScheme.primary,
      elevation: 0,
      iconTheme: IconThemeData(
        color: theme.colorScheme.onPrimary,
      ),
      systemOverlayStyle: SystemUiOverlayStyle.light,
      title: Padding(
        padding: const EdgeInsets.only(
          right: 56,
        ),
        child: Center(
          child: BlocBuilder<NavigationBarCubit, NavigationBarState>(
            builder: (context, state) {
              if (state.index == 0) {
                return const CustomImageAsset(
                  imageUrl: AppImages.appLogo,
                  boxFit: BoxFit.scaleDown,
                  height: 50,
                );
              }
              return CustomText(
                text: Configs.configHomeNav[state.index],
                color: AppColors.titleAppBar,
                fontWeight: FontWeight.bold,
                fontSize: 18.spMax,
              );
            },
          ),
        ),
      ),
    );
  }
}
