part of 'widgets.dart';

class ForgetPasswordButton extends StatelessWidget {
  const ForgetPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          context.goNamed(Routes.routeRecoveryPassword.name);
        },
        child: CustomText(
          text: l10n.forgotPassword,
          fontSize: 14.spMax,
          color: theme.colorScheme.onSurface,
          textAlign: TextAlign.right,
        ),
      ),
    );
  }
}
