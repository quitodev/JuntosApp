part of 'widgets.dart';

class DepartmentTextField extends StatelessWidget {
  const DepartmentTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    return BlocBuilder<RegistrationCubit, RegistrationState>(
      builder: (context, state) {
        return MouseRegion(
          cursor: state.departments.isNotEmpty
              ? SystemMouseCursors.click
              : MouseCursor.defer,
          child: GestureDetector(
            onTap: () {
              if (state.departments.isNotEmpty) {
                showModalBottomSheet(
                  context: context,
                  backgroundColor: theme.colorScheme.onPrimary,
                  builder: (_) {
                    return RegistrationModalContent(
                      buildContext: context,
                      modal: Modal.departments,
                      items: state.departments,
                    );
                  },
                );
              }
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (state.account.department.isNotEmpty)
                  CustomText(
                    text: l10n.department,
                    fontSize: 11.spMax,
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.onSurface,
                  ),
                Row(
                  children: [
                    CustomText(
                      text: state.account.department.isEmpty
                          ? l10n.department
                          : state.departments
                              .singleWhere(
                                (e) => e.id == state.account.department,
                              )
                              .name,
                      fontSize: 14.spMax,
                      fontWeight: FontWeight.bold,
                      color: state.account.department.isEmpty
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
