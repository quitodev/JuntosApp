part of 'widgets.dart';

final _completeRegistrationPageFormKey = GlobalKey<FormBuilderState>();

class CompleteRegistrationForm extends StatelessWidget {
  const CompleteRegistrationForm({super.key});

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
                key: _completeRegistrationPageFormKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CodeSentText(),
                    CodeTextField(),
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
              if (_completeRegistrationPageFormKey.currentState != null) {
                _completeRegistrationPageFormKey.currentState!.save();
                if (_completeRegistrationPageFormKey.currentState!.validate()) {
                  await context.read<CompleteRegistrationCubit>().verifyEmail();
                  //final mapValues = Map.of(_completeRegistrationPageFormKey.currentState!.value);
                }
              }
            },
          ),
        ),
      ],
    );
  }
}
