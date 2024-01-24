part of 'widgets.dart';

class NumberDocumentTextField extends StatelessWidget {
  const NumberDocumentTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return CustomTextField(
      title: l10n.numberDocument,
      icon: AppSvg.carnet,
      initialValue: BlocProvider.of<RegistrationCubit>(context)
          .state
          .account
          .numberDocument,
      inputType: TextInputType.number,
      validators: [
        FormBuilderValidators.required(),
        //FormBuilderValidators.minLength(8),
        FormBuilderValidators.maxLength(200),
      ],
      onSubmitted: (value) {
        if (BlocProvider.of<RegistrationCubit>(context)
                .state
                .account
                .typeDocument ==
            Configs.configCarnet[0]) {
          if (value != null) {
            context.read<RegistrationCubit>().findDocument(value);
          }
        }
      },
      onChanged: (value) {
        if (value != null) {
          context.read<RegistrationCubit>().writeNumberDocument(value);
        }
      },
    );
  }
}
