part of 'widgets.dart';

class ResendEmailButton extends StatelessWidget {
  const ResendEmailButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    return BlocBuilder<RecoveryPasswordCubit, RecoveryPasswordState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                if (state.email.length < 15 || !state.email.contains('@')) {
                  AppUtils.showSnackbar(
                    context,
                    'Revisa el email ingresado',
                  );
                  return;
                }
                context.read<RecoveryPasswordCubit>().recoveryPassword();
              },
              child: Text.rich(
                TextSpan(
                  text: l10n.doesntReceiveTheEmail,
                  style: theme.textTheme.bodyMedium!.copyWith(
                    fontSize: 16.spMax,
                    color: theme.colorScheme.secondary,
                  ),
                  children: [
                    TextSpan(
                      text: l10n.sendAgain,
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
      },
    );
  }
}
