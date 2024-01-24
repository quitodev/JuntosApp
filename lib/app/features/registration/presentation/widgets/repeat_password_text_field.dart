part of 'widgets.dart';

class RepeatPasswordTextField extends StatelessWidget {
  const RepeatPasswordTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BlocBuilder<RegistrationCubit, RegistrationState>(
      builder: (context, state) {
        return CustomTextField(
          title: l10n.repeatPassword,
          icon: state.showRepeatedPassword ? AppSvg.eyeHide : AppSvg.eyeShow,
          obscureText: !state.showRepeatedPassword,
          validators: [
            FormBuilderValidators.required(),
            //FormBuilderValidators.minLength(8),
            FormBuilderValidators.maxLength(200),
            FormBuilderValidators.equal(state.account.password),
          ],
          onChanged: (value) {},
          onIconTap: () {
            context
                .read<RegistrationCubit>()
                .showRepeatedPassword(!state.showRepeatedPassword);
          },
        );
      },
    );
  }
}
