part of 'widgets.dart';

class HomeDrawerMenu extends StatelessWidget {
  const HomeDrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const _DrawerHeader(),
          _DrawerItem(
            text: l10n.myProfile,
            onTap: () {
              context
                ..pushNamed(Routes.routeProfile.name)
                ..pop();
            },
          ),
          _DrawerItem(
            text: l10n.myPurchases,
            onTap: () {
              context
                ..pushNamed(Routes.routePurchases.name)
                ..pop();
            },
          ),
          _DrawerItem(
            text: l10n.help,
            onTap: () async {
              await AppUtils.openUrl(Configs.configHelp);
            },
          ),
          Container(
            height: 1,
            margin: const EdgeInsets.symmetric(vertical: 8),
            color: AppColors.itemDrawerDivider,
          ),
          _DrawerItem(
            text: l10n.board,
            color: theme.colorScheme.secondary,
            onTap: () {
              context
                ..read<NavigationBarCubit>().setCurrentIndex(0)
                ..pop();
            },
          ),
          _DrawerItem(
            text: l10n.giveaways,
            color: theme.colorScheme.secondary,
            onTap: () {
              context
                ..read<NavigationBarCubit>().setCurrentIndex(1)
                ..pop();
            },
          ),
          _DrawerItem(
            text: l10n.benefits,
            color: theme.colorScheme.secondary,
            onTap: () {
              context
                ..read<NavigationBarCubit>().setCurrentIndex(2)
                ..pop();
            },
          ),
          // _DrawerItem(
          //   text: l10n.radioJuntos,
          //   color: theme.colorScheme.secondary,
          //   onTap: () {
          //     context
          //       ..read<NavigationBarCubit>().setCurrentIndex(4)
          //       ..pop();
          //   },
          // ),
          Container(
            height: 1,
            margin: const EdgeInsets.symmetric(vertical: 8),
            color: AppColors.itemDrawerDivider,
          ),
          _DrawerItem(
            text: l10n.policiesAndTerms,
            onTap: () async {
              await AppUtils.openUrl(Configs.configTerms);
            },
          ),
          _DrawerItem(
            text: l10n.logout,
            fontWeight: FontWeight.bold,
            onTap: () async {
              final prefs = await SharedPreferences.getInstance();
              await prefs.remove('email');
              await prefs.remove('password');
              context
                ..pushReplacementNamed(Routes.routeLogin.name)
                ..pop();
            },
          ),
        ],
      ),
    );
  }
}

class _DrawerHeader extends StatelessWidget {
  const _DrawerHeader();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final account = BlocProvider.of<HomeCubit>(context).state.account;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 32,
        ),
        Center(
          child: CustomImageNetwork(
            imageUrl: account.institution.logo,
            boxFit: BoxFit.scaleDown,
            height: 120,
            width: 120,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          children: [
            const SizedBox(
              width: 16,
            ),
            CustomImageAvatar(
              image: account.avatar,
              radius: 24,
            ),
            const SizedBox(
              width: 8,
            ),
            CustomText(
              text:
                  '${account.fullName} ${account.firstName} ${account.lastName}',
              color: theme.colorScheme.primary,
              fontWeight: FontWeight.bold,
              fontSize: 20.spMax,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              width: 200,
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }
}

class _DrawerItem extends StatelessWidget {
  const _DrawerItem({
    required this.text,
    required this.onTap,
    this.color,
    this.fontWeight,
  });

  final String text;
  final Function() onTap;
  final Color? color;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      title: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: CustomText(
          text: text,
          fontSize: 14.spMax,
          fontWeight: fontWeight ?? FontWeight.normal,
          color: color ?? theme.colorScheme.onBackground,
        ),
      ),
      onTap: onTap,
    );
  }
}
