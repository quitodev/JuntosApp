part of 'widgets.dart';

class PostItem extends StatelessWidget {
  const PostItem({
    required this.post,
    super.key,
  });

  final Post post;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      height: 1.sw + 150,
      decoration: BoxDecoration(
        color: theme.colorScheme.onPrimary,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _PostDate(
              date: post.createdAt,
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                const _PostLogo(
                  imageUrl: AppImages
                      .appIcon, // TODO(me): Reemplazar cuando esté el logo de la institución
                ),
                const SizedBox(
                  width: 16,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _PostName(
                      name: post.title,
                    ),
                    const _PostDescription(
                      description:
                          'Descripción del evento', // TODO(me): Reemplazar cuando esté la descripción
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            if (post.image.isNotEmpty)
              _PostImage(
                imageUrl: post.image,
              ),
            if (post.video.isNotEmpty)
              _PostVideo(
                videoUrl: post.video,
              ),
            const SizedBox(
              height: 8,
            ),
            _PostButtons(post: post),
          ],
        ),
      ),
    );
  }
}

class _PostDate extends StatelessWidget {
  const _PostDate({
    required this.date,
  });

  final String date;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: CustomText(
        text: date,
        fontWeight: FontWeight.bold,
        fontSize: 15.spMax,
        color: const Color.fromARGB(255, 63, 0, 83),
        textAlign: TextAlign.right,
      ),
    );
  }
}

class _PostLogo extends StatelessWidget {
  const _PostLogo({
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CustomImageNetwork(
      imageUrl: imageUrl,
      boxFit: BoxFit.scaleDown,
      height: 80,
      width: 80,
    );
  }
}

class _PostName extends StatelessWidget {
  const _PostName({
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return CustomText(
      text: name,
      fontWeight: FontWeight.bold,
      fontSize: 16.spMax,
      color: const Color.fromARGB(255, 80, 80, 80),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      width: 1.sw - 128,
    );
  }
}

class _PostDescription extends StatelessWidget {
  const _PostDescription({
    required this.description,
  });

  final String description;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return CustomText(
      text: description,
      fontSize: 14.spMax,
      color: theme.colorScheme.onSurface,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      width: 1.sw - 128,
    );
  }
}

class _PostImage extends StatelessWidget {
  const _PostImage({
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomImageNetwork(
        imageUrl: imageUrl,
        boxFit: BoxFit.scaleDown,
      ),
    );
  }
}

class _PostVideo extends StatefulWidget {
  const _PostVideo({
    required this.videoUrl,
  });

  final String videoUrl;

  @override
  _PostVideoState createState() => _PostVideoState();
}

class _PostVideoState extends State<_PostVideo> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(Configs.configUrlImages + widget.videoUrl),
    )..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onLongPress: () {
          setState(() {
            _controller
              ..play()
              ..setLooping(true);
          });
        },
        onLongPressEnd: (_) {
          setState(() {
            _controller.pause();
          });
        },
        child: _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(
                  _controller,
                ),
              )
            : const Center(
                child: CustomIcon(
                  icon: AppSvg.play,
                  color: Color.fromARGB(255, 63, 0, 83),
                  size: 80,
                ),
              ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

class _PostButtons extends StatelessWidget {
  const _PostButtons({
    required this.post,
  });

  final Post post;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        CustomButton(
          height: 24,
          width: 24,
          icon: AppSvg.share,
          iconSize: 24,
          iconColor: AppColors.boardButtons,
          backgroundColor: theme.colorScheme.onPrimary,
          borderWidth: 0,
          radius: 48,
          blurRadius: 100,
          onTap: () async {
            await AppUtils.shareContent(
              PostItem(post: post),
            );
          },
        ),
        const Spacer(),
        // CustomButton(
        //   height: 24,
        //   width: 24,
        //   icon: AppSvg.thumbUp,
        //   iconSize: 24,
        //   iconColor: AppColors.boardButtons,
        //   backgroundColor: theme.colorScheme.onPrimary,
        //   borderWidth: 0,
        //   radius: 48,
        //   blurRadius: 100,
        //   onTap: () {
        //     context.read<BoardCubit>().likePost(post.id);
        //   },
        // ),
        // const SizedBox(
        //   width: 4,
        // ),
        // CustomButton(
        //   height: 24,
        //   width: 24,
        //   icon: AppSvg.thumbDown,
        //   iconSize: 24,
        //   iconColor: AppColors.boardButtons,
        //   backgroundColor: theme.colorScheme.onPrimary,
        //   borderWidth: 0,
        //   radius: 48,
        //   blurRadius: 100,
        //   onTap: () {
        //     context.read<BoardCubit>().dislikePost(post.id);
        //   },
        // ),
      ],
    );
  }
}
