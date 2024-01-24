part of 'widgets.dart';

class CustomImageAsset extends StatefulWidget {
  const CustomImageAsset({
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
  final AlignmentGeometry alignment;
  final BoxFit? boxFit;
  final double? height;
  final double? width;
  final Color? color;
  final BlendMode? blendMode;

  @override
  State<CustomImageAsset> createState() => _CustomImageAssetState();
}

class _CustomImageAssetState extends State<CustomImageAsset> {
  late Image image;

  @override
  void initState() {
    super.initState();
    image = Image.asset(
      widget.imageUrl,
      alignment: widget.alignment,
      fit: widget.boxFit,
      height: widget.height,
      width: widget.width,
      color: widget.color,
      colorBlendMode: widget.blendMode,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(image.image, context);
  }

  @override
  Widget build(BuildContext context) {
    return image;
  }
}
