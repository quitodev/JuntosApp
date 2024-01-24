part of 'widgets.dart';

class ProvinceTextField extends StatelessWidget {
  const ProvinceTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return MouseRegion(
          cursor: state.provinces.isNotEmpty
              ? SystemMouseCursors.click
              : MouseCursor.defer,
          child: GestureDetector(
            onTap: () {
              if (state.provinces.isNotEmpty) {
                showModalBottomSheet(
                  context: context,
                  backgroundColor: theme.colorScheme.onPrimary,
                  builder: (_) {
                    return ProfileModalContent(
                      buildContext: context,
                      modal: Modal.provinces,
                      items: state.provinces,
                    );
                  },
                );
              }
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 32,
                ),
                if (state.account.province.isNotEmpty)
                  CustomText(
                    text: l10n.province,
                    fontSize: 11.spMax,
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.onSurface,
                  ),
                Row(
                  children: [
                    CustomText(
                      text: state.account.province.isEmpty
                          ? l10n.province
                          : state.provinces
                              .singleWhere(
                                (e) => e.id == state.account.province,
                              )
                              .name,
                      fontSize: 14.spMax,
                      fontWeight: FontWeight.bold,
                      color: state.account.province.isEmpty
                          ? theme.colorScheme.onSurface
                          : theme.colorScheme.onBackground,
                    ),
                    const Spacer(),
                    CustomIcon(
                      icon: AppSvg.map,
                      color: theme.colorScheme.onSurface,
                      size: 32,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
                Container(
                  height: 2,
                  color: AppColors.itemDrawerDivider,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
