part of 'widgets.dart';

class FullNameTextField extends StatelessWidget {
  const FullNameTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return CustomTextField(
      title: l10n.fullName,
      initialValue:
          BlocProvider.of<RegistrationCubit>(context).state.account.fullName,
      icon: AppSvg.account,
      inputType: TextInputType.name,
      validators: [
        FormBuilderValidators.required(),
        //FormBuilderValidators.minLength(8),
        FormBuilderValidators.maxLength(200),
      ],
      onChanged: (value) {
        if (value != null) {
          context.read<RegistrationCubit>().writeFullName(value);
        }
      },
    );
  }
}
