part of 'widgets.dart';

class RegisterText extends StatelessWidget {
  const RegisterText({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    return CustomText(
      text: l10n.register,
      fontSize: 16.spMax,
      fontWeight: FontWeight.bold,
      color: theme.colorScheme.onPrimary,
      textAlign: TextAlign.center,
    );
  }
}
