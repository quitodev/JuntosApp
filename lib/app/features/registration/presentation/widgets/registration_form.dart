part of 'widgets.dart';

final _registrationPageFormKey = GlobalKey<FormBuilderState>();

class RegistrationForm extends StatelessWidget {
  const RegistrationForm({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 32,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: theme.colorScheme.onPrimary,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: theme.colorScheme.shadow,
                  spreadRadius: 4,
                  blurRadius: 2,
                  offset: const Offset(1, 1),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 48,
              ),
              child: FormBuilder(
                key: _registrationPageFormKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TypeDocumentRadioGroup(),
                    NumberDocumentTextField(),
                    FullNameTextField(),
                    FirstNameTextField(),
                    LastNameTextField(),
                    AddressTextField(),
                    DepartmentTextField(),
                    ProvinceTextField(),
                    DistrictTextField(),
                    PhoneNumberTextField(),
                    EmailTextField(),
                    PasswordTextField(),
                    RepeatPasswordTextField(),
                    InstitutionTextField(),
                    SizedBox(
                      height: 24,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        BlocBuilder<RegistrationCubit, RegistrationState>(
          builder: (context, state) {
            return Positioned(
              bottom: 0,
              child: CustomContinueButton(
                onTap: () async {
                  if (_registrationPageFormKey.currentState != null) {
                    _registrationPageFormKey.currentState!.save();
                    if (_registrationPageFormKey.currentState!.validate()) {
                      if (state.account.department.isEmpty ||
                          state.account.province.isEmpty ||
                          state.account.district.isEmpty ||
                          state.account.institutionId.isEmpty) {
                        AppUtils.showSnackbar(
                          context,
                          'Por favor revisa los datos ingresados',
                        );
                        return;
                      }
                      await context.read<RegistrationCubit>().signUp();
                      //final mapValues = Map.of(_registrationPageFormKey.currentState!.value);
                    }
                  }
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
