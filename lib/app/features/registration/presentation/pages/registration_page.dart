part of 'pages.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocProvider(
      create: (_) => RegistrationCubit(
        findDocument: getIt<FindDocument>(),
        getDepartments: getIt<GetDepartments>(),
        getProvinces: getIt<GetProvinces>(),
        getInstitutions: getIt<GetInstitutions>(),
        signUp: getIt<SignUp>(),
      )..getDepartments(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        backgroundColor: theme.colorScheme.background,
        appBar: const CustomAppBar(),
        body: BlocConsumer<RegistrationCubit, RegistrationState>(
          listener: (context, state) {
            if (state.status is RegistrationSuccess) {
              context.pushReplacementNamed(
                Routes.routeCompleteRegistration.name,
                extra: state.account,
              );
            }
            if (state.status is RegistrationError) {
              AppUtils.showSnackbar(
                context,
                (state.status as RegistrationError).text,
              );
            }
          },
          builder: (context, state) {
            if (state.status is RegistrationInitial) {
              return const _RegistrationContent();
            }
            return const CustomProgress();
          },
        ),
      ),
    );
  }
}

class _RegistrationContent extends StatelessWidget {
  const _RegistrationContent();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Stack(
      children: [
        SizedBox(
          height: 1.sh,
          width: 1.sw,
          child: const CustomImageAsset(
            imageUrl: AppImages.login,
            boxFit: BoxFit.fill,
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            color: theme.colorScheme.onPrimary,
            height: 1.sh - 0.6.sh,
            width: 1.sw,
          ),
        ),
        const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(bottom: 24),
            child: Column(
              children: [
                CustomImageLogo(),
                RegisterText(),
                RegistrationForm(),
                SizedBox(
                  height: 48,
                ),
                TermsButton(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
