part of 'pages.dart';

class RecoveryPasswordPage extends StatelessWidget {
  const RecoveryPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocProvider(
      create: (_) => RecoveryPasswordCubit(
        recoveryPassword: getIt<RecoveryPassword>(),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        backgroundColor: theme.colorScheme.background,
        appBar: const CustomAppBar(),
        body: BlocConsumer<RecoveryPasswordCubit, RecoveryPasswordState>(
          listener: (context, state) {
            if (state.status is RecoveryPasswordSuccess) {
              context.pop();
              AppUtils.showSnackbar(
                context,
                'Revisa tu casilla de correo y sigue las instrucciones del email',
              );
            }
            if (state.status is RecoveryPasswordError) {
              AppUtils.showSnackbar(
                context,
                (state.status as RecoveryPasswordError).text,
              );
            }
          },
          builder: (context, state) {
            if (state.status is RecoveryPasswordInitial) {
              return const _RecoveryPasswordContent();
            }
            return const CustomProgress();
          },
        ),
      ),
    );
  }
}

class _RecoveryPasswordContent extends StatelessWidget {
  const _RecoveryPasswordContent();

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
                RecoveryPasswordText(),
                RecoveryPasswordForm(),
                SizedBox(
                  height: 48,
                ),
                ResendEmailButton(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
