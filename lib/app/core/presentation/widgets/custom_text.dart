part of 'widgets.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.inputType,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.width,
    super.key,
  });

  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextInputType? inputType;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final double? width;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      width: width,
      child: Text(
        text,
        style: theme.textTheme.bodyMedium!.copyWith(
          fontWeight: fontWeight ?? FontWeight.normal,
          fontSize: fontSize ?? 14.spMax,
          color: color ?? theme.colorScheme.onSurface,
        ),
        textAlign: textAlign ?? TextAlign.left,
        maxLines: maxLines ?? 1,
        overflow: overflow,
      ),
    );
  }
}
