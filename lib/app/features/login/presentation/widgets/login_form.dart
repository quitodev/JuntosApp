part of 'widgets.dart';

final _loginPageFormKey = GlobalKey<FormBuilderState>();

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

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
                vertical: 40,
              ),
              child: FormBuilder(
                key: _loginPageFormKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    EmailTextField(),
                    PasswordTextField(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RememberSessionButton(),
                        ForgetPasswordButton(),
                      ],
                    ),
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
              if (_loginPageFormKey.currentState != null) {
                _loginPageFormKey.currentState!.save();
                if (_loginPageFormKey.currentState!.validate()) {
                  await context.read<LoginCubit>().signIn();
                  //final mapValues = Map.of(_loginPageFormKey.currentState!.value);
                }
              }
            },
          ),
        ),
      ],
    );
  }
}
