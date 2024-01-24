part of 'widgets.dart';

class TypeDocumentRadioGroup extends StatelessWidget {
  const TypeDocumentRadioGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomRadioGroup(
      text: '',
      items: Configs.configCarnet,
      initialValue: Configs.configCarnet[0],
      validator: FormBuilderValidators.required(),
      onChanged: (value) {
        if (value != null) {
          context.read<RegistrationCubit>().writeTypeDocument(value);
        }
      },
    );
  }
}
