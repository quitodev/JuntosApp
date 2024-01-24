part of 'widgets.dart';

class RegistrationButton extends StatelessWidget {
  const RegistrationButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          context.goNamed(Routes.routeRegistration.name);
        },
        child: Text.rich(
          TextSpan(
            text: l10n.doesntHaveAnAccount,
            style: theme.textTheme.bodyMedium!.copyWith(
              fontSize: 16.spMax,
              color: theme.colorScheme.primary,
            ),
            children: [
              TextSpan(
                text: l10n.register,
                style: theme.textTheme.bodyMedium!.copyWith(
                  fontSize: 16.spMax,
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
