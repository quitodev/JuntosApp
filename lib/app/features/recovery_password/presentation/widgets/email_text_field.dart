part of 'widgets.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      title: '',
      fontSize: 20.spMax,
      fontWeight: FontWeight.normal,
      textAlign: TextAlign.center,
      inputType: TextInputType.emailAddress,
      validators: [
        FormBuilderValidators.required(),
        //FormBuilderValidators.minLength(8),
        FormBuilderValidators.maxLength(200),
        FormBuilderValidators.email(),
      ],
      onChanged: (value) {
        if (value != null) {
          context.read<RecoveryPasswordCubit>().writeEmail(value);
        }
      },
    );
  }
}
