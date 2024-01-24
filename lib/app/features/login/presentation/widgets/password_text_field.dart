part of 'widgets.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return CustomTextField(
          title: l10n.password,
          icon: state.showPassword ? AppSvg.eyeHide : AppSvg.eyeShow,
          obscureText: !state.showPassword,
          validators: [
            FormBuilderValidators.required(),
            //FormBuilderValidators.minLength(8),
            FormBuilderValidators.maxLength(200),
          ],
          onChanged: (value) {
            if (value != null) {
              context.read<LoginCubit>().writePassword(value);
            }
          },
          onIconTap: () {
            context.read<LoginCubit>().showPassword(!state.showPassword);
          },
        );
      },
    );
  }
}
