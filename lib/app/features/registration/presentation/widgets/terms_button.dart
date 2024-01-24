part of 'widgets.dart';

class TermsButton extends StatelessWidget {
  const TermsButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () async {
            await AppUtils.openUrl(Configs.configTerms);
          },
          child: Text.rich(
            TextSpan(
              text: l10n.clickingNext,
              style: theme.textTheme.bodyMedium!.copyWith(
                fontSize: 16.spMax,
                color: theme.colorScheme.secondary,
              ),
              children: [
                TextSpan(
                  text: l10n.privacyPolicies,
                  style: theme.textTheme.bodyMedium!.copyWith(
                    fontSize: 16.spMax,
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.secondary,
                  ),
                ),
                TextSpan(
                  text: l10n.and,
                  style: theme.textTheme.bodyMedium!.copyWith(
                    fontSize: 16.spMax,
                    color: theme.colorScheme.secondary,
                  ),
                ),
                TextSpan(
                  text: l10n.termsOfUse,
                  style: theme.textTheme.bodyMedium!.copyWith(
                    fontSize: 16.spMax,
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.secondary,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
          ),
        ),
      ),
    );
  }
}
