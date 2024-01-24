part of 'widgets.dart';

final _profilePageFormKey = GlobalKey<FormBuilderState>();

class ProfileForm extends StatelessWidget {
  const ProfileForm({super.key});

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
                  blurRadius: 10,
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
                key: _profilePageFormKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    WelcomeText(),
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
        BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            return Positioned(
              bottom: 0,
              child: CustomContinueButton(
                onTap: () async {
                  if (_profilePageFormKey.currentState != null) {
                    _profilePageFormKey.currentState!.save();
                    if (_profilePageFormKey.currentState!.validate()) {
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
                      await context.read<ProfileCubit>().updateUser();
                      //final mapValues = Map.of(_profilePageFormKey.currentState!.value);
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
