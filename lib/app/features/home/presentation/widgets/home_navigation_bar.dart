part of 'widgets.dart';

class HomeNavigationBar extends StatelessWidget {
  const HomeNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    return BlocBuilder<NavigationBarCubit, NavigationBarState>(
      builder: (context, state) {
        return BottomNavigationBar(
          currentIndex: state.index > 3 ? 3 : state.index,
          onTap: (value) {
            context.read<NavigationBarCubit>().setCurrentIndex(value);
            if (value == 3) {
              context.read<NavigationBarCubit>().showBadge(false);
            }
          },
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 10.spMax,
          unselectedFontSize: 10.spMax,
          selectedItemColor: state.index > 3
              ? theme.colorScheme.primary
              : theme.colorScheme.secondary,
          unselectedItemColor: theme.colorScheme.primary,
          showUnselectedLabels: true,
          items: [
            BottomNavigationBarItem(
              icon: _NavigationIcon(
                icon: AppSvg.board,
                color: state.index == 0
                    ? theme.colorScheme.secondary
                    : theme.colorScheme.primary,
              ),
              label: l10n.boardNav,
            ),
            BottomNavigationBarItem(
              icon: _NavigationIcon(
                icon: AppSvg.giveaways,
                color: state.index == 1
                    ? theme.colorScheme.secondary
                    : theme.colorScheme.primary,
              ),
              label: l10n.giveawaysNav,
            ),
            BottomNavigationBarItem(
              icon: _NavigationIcon(
                icon: AppSvg.benefits,
                color: state.index == 2
                    ? theme.colorScheme.secondary
                    : theme.colorScheme.primary,
              ),
              label: l10n.benefitsNav,
            ),
            BottomNavigationBarItem(
              icon: Stack(
                children: [
                  _NavigationIcon(
                    icon: AppSvg.bell,
                    color: state.index == 3
                        ? theme.colorScheme.secondary
                        : theme.colorScheme.primary,
                  ),
                  if (state.showBadge)
                    const Positioned(
                      right: 0,
                      top: 0,
                      child: Padding(
                        padding: EdgeInsets.all(4),
                        child: CircleAvatar(
                          backgroundColor: Colors.red,
                          radius: 8,
                        ),
                      ),
                    ),
                ],
              ),
              label: l10n.notificationsNav,
            ),
          ],
        );
      },
    );
  }
}

class _NavigationIcon extends StatelessWidget {
  const _NavigationIcon({
    required this.icon,
    required this.color,
  });

  final String icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return CustomIcon(
      icon: icon,
      color: color,
      size: 40,
    );
  }
}
