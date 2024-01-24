part of 'widgets.dart';

class CodeTextField extends StatelessWidget {
  const CodeTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      title: '',
      fontSize: 34.spMax,
      letterSpacing: 10,
      maxLength: 6,
      fontWeight: FontWeight.normal,
      textAlign: TextAlign.center,
      inputType: TextInputType.number,
      validators: [
        FormBuilderValidators.required(),
        //FormBuilderValidators.minLength(5),
        FormBuilderValidators.maxLength(6),
        FormBuilderValidators.numeric(),
      ],
      onChanged: (value) {
        if (value != null) {
          context
              .read<CompleteRegistrationCubit>()
              .writeVerificationCode(value);
        }
      },
    );
  }
}
