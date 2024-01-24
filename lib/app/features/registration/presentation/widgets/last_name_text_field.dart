part of 'widgets.dart';

class LastNameTextField extends StatelessWidget {
  const LastNameTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return CustomTextField(
      title: l10n.lastName,
      initialValue:
          BlocProvider.of<RegistrationCubit>(context).state.account.lastName,
      icon: AppSvg.woman,
      inputType: TextInputType.name,
      validators: [
        FormBuilderValidators.required(),
        //FormBuilderValidators.minLength(8),
        FormBuilderValidators.maxLength(200),
      ],
      onChanged: (value) {
        if (value != null) {
          context.read<RegistrationCubit>().writeLastName(value);
        }
      },
    );
  }
}
