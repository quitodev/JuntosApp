part of 'widgets.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return CustomTextField(
          title: l10n.password,
          icon: state.showPassword ? AppSvg.eyeShow : AppSvg.eyeHide,
          obscureText: state.showPassword,
          validators: [
            FormBuilderValidators.required(),
            //FormBuilderValidators.minLength(8),
            FormBuilderValidators.maxLength(200),
          ],
          onChanged: (value) {
            if (value != null) {
              context.read<ProfileCubit>().writePassword(value);
            }
          },
          onIconTap: () {
            context.read<ProfileCubit>().showPassword(!state.showPassword);
          },
        );
      },
    );
  }
}
