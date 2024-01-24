part of 'widgets.dart';

class InstitutionTextField extends StatelessWidget {
  const InstitutionTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return MouseRegion(
          cursor: state.institutions.isNotEmpty
              ? SystemMouseCursors.click
              : MouseCursor.defer,
          child: GestureDetector(
            onTap: () {
              if (state.institutions.isNotEmpty) {
                showModalBottomSheet(
                  context: context,
                  backgroundColor: theme.colorScheme.onPrimary,
                  builder: (_) {
                    return ProfileModalContent(
                      buildContext: context,
                      modal: Modal.institutions,
                      items: state.institutions,
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
                  height: 8,
                ),
                if (state.account.institutionId.isNotEmpty)
                  CustomText(
                    text: l10n.institution,
                    fontSize: 11.spMax,
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.onSurface,
                  ),
                Row(
                  children: [
                    CustomText(
                      text: state.account.institutionId.isEmpty
                          ? l10n.institution
                          : state.institutions
                              .singleWhere(
                                (e) => e.id == state.account.institutionId,
                              )
                              .label,
                      fontSize: 14.spMax,
                      fontWeight: FontWeight.bold,
                      color: state.account.institutionId.isEmpty
                          ? theme.colorScheme.onSurface
                          : theme.colorScheme.onBackground,
                    ),
                    const Spacer(),
                    CustomIcon(
                      icon: AppSvg.institution,
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
