part of 'pages.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocProvider(
      create: (_) => LoginCubit(
        signIn: getIt<SignIn>(),
        getUser: getIt<GetUser>(),
      )..checkSession(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: theme.colorScheme.background,
        body: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state.status is LoginSuccess) {
              context.pushReplacementNamed(
                Routes.routeAnimation.name,
                extra: {
                  'logo': state.account.institution.logo,
                },
              );
            }
            if (state.status is LoginError) {
              AppUtils.showSnackbar(
                context,
                (state.status as LoginError).text,
              );
            }
          },
          builder: (context, state) {
            if (state.status is LoginInitial) {
              return const _LoginContent();
            }
            return const CustomProgress();
          },
        ),
      ),
    );
  }
}

class _LoginContent extends StatelessWidget {
  const _LoginContent();

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
                SignInText(),
                LoginForm(),
                SizedBox(
                  height: 48,
                ),
                RegistrationButton(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
