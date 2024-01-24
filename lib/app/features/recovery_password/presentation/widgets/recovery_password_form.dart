part of 'widgets.dart';

final _recoveryPasswordPageFormKey = GlobalKey<FormBuilderState>();

class RecoveryPasswordForm extends StatelessWidget {
  const RecoveryPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 32,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: theme.colorScheme.onPrimary,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: theme.colorScheme.shadow,
                  spreadRadius: 4,
                  blurRadius: 2,
                  offset: const Offset(1, 1),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 56,
              ),
              child: FormBuilder(
                key: _recoveryPasswordPageFormKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    EmailAssociatedText(),
                    EmailTextField(),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: CustomContinueButton(
            onTap: () async {
              if (_recoveryPasswordPageFormKey.currentState != null) {
                _recoveryPasswordPageFormKey.currentState!.save();
                if (_recoveryPasswordPageFormKey.currentState!.validate()) {
                  await context
                      .read<RecoveryPasswordCubit>()
                      .recoveryPassword();
                  //final mapValues = Map.of(_recoveryPasswordPageFormKey.currentState!.value);
                }
              }
            },
          ),
        ),
      ],
    );
  }
}
