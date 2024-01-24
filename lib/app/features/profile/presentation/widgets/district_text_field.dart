part of 'widgets.dart';

class DistrictTextField extends StatelessWidget {
  const DistrictTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return MouseRegion(
          cursor: state.account.province.isNotEmpty
              ? SystemMouseCursors.click
              : MouseCursor.defer,
          child: GestureDetector(
            onTap: () {
              if (state.account.province.isNotEmpty) {
                showModalBottomSheet(
                  context: context,
                  backgroundColor: theme.colorScheme.onPrimary,
                  builder: (_) {
                    return ProfileModalContent(
                      buildContext: context,
                      modal: Modal.districts,
                      items: state.provinces
                          .singleWhere(
                            (e) => e.id == state.account.province,
                          )
                          .districts,
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
                if (state.account.district.isNotEmpty)
                  CustomText(
                    text: l10n.district,
                    fontSize: 11.spMax,
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.onSurface,
                  ),
                Row(
                  children: [
                    CustomText(
                      text: state.account.district.isEmpty
                          ? l10n.district
                          : state.provinces
                              .singleWhere(
                                (e) => e.id == state.account.province,
                              )
                              .districts
                              .singleWhere(
                                (e) => e.id == state.account.district,
                              )
                              .name,
                      fontSize: 14.spMax,
                      fontWeight: FontWeight.bold,
                      color: state.account.district.isEmpty
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
                const SizedBox(
                  height: 24,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
