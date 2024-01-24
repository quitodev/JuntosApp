part of 'widgets.dart';

class FirstNameTextField extends StatelessWidget {
  const FirstNameTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return CustomTextField(
      title: l10n.firstName,
      initialValue:
          BlocProvider.of<ProfileCubit>(context).state.account.firstName,
      icon: AppSvg.man,
      inputType: TextInputType.name,
      validators: [
        FormBuilderValidators.required(),
        //FormBuilderValidators.minLength(8),
        FormBuilderValidators.maxLength(200),
      ],
      onChanged: (value) {
        if (value != null) {
          context.read<ProfileCubit>().writeFirstName(value);
        }
      },
    );
  }
}
