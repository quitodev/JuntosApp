part of 'widgets.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return CustomTextField(
      title: l10n.email,
      icon: AppSvg.account,
      inputType: TextInputType.emailAddress,
      validators: [
        FormBuilderValidators.required(),
        //FormBuilderValidators.minLength(8),
        FormBuilderValidators.maxLength(200),
        FormBuilderValidators.email(),
      ],
      onChanged: (value) {
        if (value != null) {
          context.read<LoginCubit>().writeEmail(value);
        }
      },
    );
  }
}
