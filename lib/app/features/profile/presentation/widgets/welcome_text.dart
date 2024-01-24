part of 'widgets.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Center(
        child: Text.rich(
          TextSpan(
            text: l10n.welcome,
            style: theme.textTheme.bodyMedium!.copyWith(
              fontSize: 16.spMax,
              color: theme.colorScheme.onBackground,
            ),
            children: [
              TextSpan(
                text: BlocProvider.of<ProfileCubit>(context)
                    .state
                    .account
                    .fullName
                    .toUpperCase(),
                style: theme.textTheme.bodyMedium!.copyWith(
                  fontSize: 16.spMax,
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onBackground,
                ),
              ),
              TextSpan(
                text: l10n.modifyYourProfile,
                style: theme.textTheme.bodyMedium!.copyWith(
                  fontSize: 16.spMax,
                  color: theme.colorScheme.onBackground,
                ),
              ),
            ],
          ),
          textAlign: TextAlign.center,
          maxLines: 2,
        ),
      ),
    );
  }
}
