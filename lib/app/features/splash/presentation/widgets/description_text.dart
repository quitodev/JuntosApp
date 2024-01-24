part of 'widgets.dart';

class DescriptionText extends StatelessWidget {
  const DescriptionText({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    return CustomText(
      text: l10n.becauseTogether,
      fontSize: 18.spMax,
      fontWeight: FontWeight.bold,
      color: theme.colorScheme.onPrimary,
      textAlign: TextAlign.center,
    );
  }
}
