part of 'widgets.dart';

class CustomImageNetwork extends StatelessWidget {
  const CustomImageNetwork({
    required this.imageUrl,
    super.key,
    this.alignment = Alignment.center,
    this.boxFit,
    this.height,
    this.width,
    this.color,
    this.blendMode,
  });

  final String imageUrl;
  final Alignment alignment;
  final BoxFit? boxFit;
  final double? height;
  final double? width;
  final Color? color;
  final BlendMode? blendMode;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: Configs.configUrlImages + imageUrl,
      alignment: alignment,
      fit: boxFit,
      height: height,
      width: width,
      color: color,
      colorBlendMode: blendMode,
      // placeholder: (context, url) {
      //   return const CustomProgress();
      // },
      errorWidget: (_, url, error) {
        return const SizedBox.shrink();
      },
      errorListener: (value) {
        log('Error network image $value');
      },
    );
  }
}
