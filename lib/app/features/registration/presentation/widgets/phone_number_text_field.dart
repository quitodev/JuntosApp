part of 'widgets.dart';

class PhoneNumberTextField extends StatelessWidget {
  const PhoneNumberTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return CustomTextField(
      title: l10n.phone,
      icon: AppSvg.phone,
      inputType: TextInputType.phone,
      validators: [
        FormBuilderValidators.required(),
        //FormBuilderValidators.minLength(8),
        FormBuilderValidators.maxLength(200),
        FormBuilderValidators.numeric(),
      ],
      onChanged: (value) {
        if (value != null) {
          context.read<RegistrationCubit>().writePhoneNumber(value);
        }
      },
    );
  }
}
