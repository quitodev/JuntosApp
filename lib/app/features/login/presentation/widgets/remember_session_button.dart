part of 'widgets.dart';

class RememberSessionButton extends StatelessWidget {
  const RememberSessionButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            return SizedBox(
              width: 20,
              child: Checkbox(
                checkColor: Colors.white,
                activeColor: theme.colorScheme.secondary,
                value: state.rememberSession,
                shape: const CircleBorder(),
                onChanged: (value) {
                  if (value != null) {
                    context.read<LoginCubit>().rememberSession(value);
                  }
                },
              ),
            );
          },
        ),
        const SizedBox(
          width: 8,
        ),
        CustomText(
          text: l10n.rememberSession,
          fontSize: 14.spMax,
          color: theme.colorScheme.onSurface,
          textAlign: TextAlign.left,
        ),
      ],
    );
  }
}
