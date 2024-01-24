part of 'widgets.dart';

class AddressTextField extends StatelessWidget {
  const AddressTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return CustomTextField(
      title: l10n.address,
      initialValue:
          BlocProvider.of<RegistrationCubit>(context).state.account.address,
      icon: AppSvg.pin,
      inputType: TextInputType.streetAddress,
      validators: [
        FormBuilderValidators.required(),
        //FormBuilderValidators.minLength(8),
        FormBuilderValidators.maxLength(200),
      ],
      onChanged: (value) {
        if (value != null) {
          context.read<RegistrationCubit>().writeAddress(value);
        }
      },
    );
  }
}
