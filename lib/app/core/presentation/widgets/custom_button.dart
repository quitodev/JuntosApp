part of 'widgets.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.text,
    this.height,
    this.width,
    this.textSize,
    this.textWeight,
    this.textColor,
    this.backgroundColor,
    this.borderWidth,
    this.radius,
    this.blurRadius,
    this.icon,
    this.iconUrl,
    this.iconColor,
    this.iconSize,
    this.onTap,
  });

  final String? text;
  final double? height;
  final double? width;
  final double? textSize;
  final FontWeight? textWeight;
  final Color? textColor;
  final Color? backgroundColor;
  final double? borderWidth;
  final double? radius;
  final double? blurRadius;
  final String? icon;
  final String? iconUrl;
  final Color? iconColor;
  final double? iconSize;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: height ?? 48,
          width: width,
          decoration: BoxDecoration(
            gradient: backgroundColor == null
                ? const LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      Color.fromARGB(255, 169, 46, 171),
                      Color.fromARGB(255, 52, 11, 141),
                    ],
                  )
                : null,
            color: backgroundColor,
            borderRadius: BorderRadius.circular(radius ?? 100),
            border: borderWidth == null
                ? Border.all(
                    width: 5,
                    color: theme.colorScheme.onPrimary,
                  )
                : null,
            boxShadow: [
              BoxShadow(
                color: theme.colorScheme.shadow,
                spreadRadius: 4,
                blurRadius: blurRadius ?? 4,
                offset: const Offset(1, 1),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal:
                  text != null && (icon != null || iconUrl != null) ? 8 : 0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != null || iconUrl != null)
                  CustomIcon(
                    icon: icon,
                    iconUrl: iconUrl,
                    color: iconColor,
                    size: iconSize,
                  ),
                if (text != null && (icon != null || iconUrl != null))
                  const SizedBox(
                    width: 8,
                  ),
                if (text != null)
                  CustomText(
                    text: text!,
                    fontWeight: textWeight ?? FontWeight.bold,
                    fontSize: textSize ?? 16.spMax,
                    color: textColor ?? theme.colorScheme.onPrimary,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
