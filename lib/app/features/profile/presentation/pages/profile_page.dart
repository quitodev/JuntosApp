part of 'pages.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    return BlocProvider(
      create: (_) => ProfileCubit(
        getUser: getIt<GetUser>(),
        findDocument: getIt<FindDocument>(),
        getDepartments: getIt<GetDepartments>(),
        getProvinces: getIt<GetProvinces>(),
        getInstitutions: getIt<GetInstitutions>(),
        uploadAvatar: getIt<UploadAvatar>(),
        updateUser: getIt<UpdateUser>(),
      )..getUser(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        backgroundColor: theme.colorScheme.background,
        appBar: CustomAppBar(
          title: l10n.myProfile,
        ),
        body: BlocConsumer<ProfileCubit, ProfileState>(
          listener: (context, state) {
            if (state.status is ProfileSuccess) {
              AppUtils.showSnackbar(
                context,
                'Usuario actualizado con éxito!',
              );
              context.pop();
            }
            if (state.status is ProfileError) {
              AppUtils.showSnackbar(
                context,
                (state.status as ProfileError).text,
              );
              context.pop();
            }
          },
          builder: (context, state) {
            if (state.status is ProfileInitial) {
              return const _ProfileContent();
            }
            return const CustomProgress();
          },
        ),
      ),
    );
  }
}

class _ProfileContent extends StatelessWidget {
  const _ProfileContent();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Stack(
      children: [
        Positioned(
          top: 0,
          child: Container(
            color: theme.colorScheme.primaryContainer,
            height: 1.sh - 0.7.sh,
            width: 1.sw,
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            color: theme.colorScheme.onPrimary,
            height: 1.sh - 0.3.sh,
            width: 1.sw,
          ),
        ),
        const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(bottom: 24),
            child: Column(
              children: [
                SizedBox(
                  height: 96,
                ),
                ImageAvatar(),
                ProfileForm(),
                SizedBox(
                  height: 24,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
