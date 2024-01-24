part of 'widgets.dart';

class EmailAssociatedText extends StatelessWidget {
  const EmailAssociatedText({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    return CustomText(
      text: l10n.inputAssociatedEmail,
      fontSize: 14.spMax,
      color: theme.colorScheme.onSurface,
      textAlign: TextAlign.center,
      maxLines: 3,
    );
  }
}
