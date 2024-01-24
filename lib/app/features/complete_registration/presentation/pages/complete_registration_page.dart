part of 'pages.dart';

class CompleteRegistrationPage extends StatelessWidget {
  const CompleteRegistrationPage({
    required this.account,
    super.key,
  });

  final Account account;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocProvider(
      create: (_) => CompleteRegistrationCubit(
        verifyEmail: getIt<VerifyEmail>(),
        resendCode: getIt<ResendCode>(),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        backgroundColor: theme.colorScheme.background,
        appBar: const CustomAppBar(),
        body:
            BlocConsumer<CompleteRegistrationCubit, CompleteRegistrationState>(
          listener: (context, state) {
            if (state.status is CompleteRegistrationSuccess) {
              context.goNamed(Routes.routeLogin.name);
            }
            if (state.status is CompleteRegistrationError) {
              AppUtils.showSnackbar(
                context,
                (state.status as CompleteRegistrationError).text,
              );
            }
          },
          builder: (context, state) {
            if (state.status is CompleteRegistrationInitial) {
              return _CompleteRegistrationContent(
                account: account,
              );
            }
            return const CustomProgress();
          },
        ),
      ),
    );
  }
}

class _CompleteRegistrationContent extends StatelessWidget {
  const _CompleteRegistrationContent({
    required this.account,
  });

  final Account account;

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
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: Column(
              children: [
                const CustomImageLogo(),
                const CompleteRegistrationText(),
                const CompleteRegistrationForm(),
                const SizedBox(
                  height: 48,
                ),
                ResendCodeButton(
                  account: account,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
