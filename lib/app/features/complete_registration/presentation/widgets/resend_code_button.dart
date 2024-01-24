part of 'widgets.dart';

class ResendCodeButton extends StatelessWidget {
  const ResendCodeButton({
    required this.account,
    super.key,
  });

  final Account account;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            context.read<CompleteRegistrationCubit>().resendCode(account);
          },
          child: Text.rich(
            TextSpan(
              text: l10n.doesntReceiveTheCode,
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
  }
}
