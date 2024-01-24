part of 'widgets.dart';

class ImageAvatar extends StatelessWidget {
  const ImageAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Stack(
      children: [
        CustomImageAvatar(
          image: BlocProvider.of<ProfileCubit>(context).state.account.avatar,
          radius: 100,
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: CustomButton(
            height: 48,
            width: 48,
            icon: AppSvg.camera,
            iconSize: 48,
            iconColor: theme.colorScheme.onBackground,
            backgroundColor: theme.colorScheme.onPrimary,
            borderWidth: 0,
            radius: 96,
            onTap: () async {
              final avatar = await AppUtils.pickAvatar();
              if (avatar != null) {
                // ignore: use_build_context_synchronously
                await context.read<ProfileCubit>().uploadAvatar(avatar);
              }
            },
          ),
        ),
      ],
    );
  }
}
