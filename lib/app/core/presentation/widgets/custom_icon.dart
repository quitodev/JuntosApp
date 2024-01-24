part of 'widgets.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({
    this.icon,
    this.iconUrl,
    this.color,
    this.size,
    this.onTap,
    super.key,
  });

  final String? icon;
  final String? iconUrl;
  final Color? color;
  final double? size;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: onTap != null ? SystemMouseCursors.click : MouseCursor.defer,
      child: GestureDetector(
        onTap: onTap,
        child: SizedBox(
          height: size,
          width: size,
          child: UnconstrainedBox(
            child: icon != null
                ? SvgPicture.asset(
                    icon!,
                    height: size,
                    width: size,
                    fit: BoxFit.scaleDown,
                    colorFilter: color != null
                        ? ColorFilter.mode(
                            color!,
                            BlendMode.srcIn,
                          )
                        : null,
                  )
                : iconUrl!.contains('.svg')
                    ? SvgPicture.network(
                        Configs.configUrlImages + iconUrl!,
                        height: size,
                        width: size,
                        fit: BoxFit.scaleDown,
                        colorFilter: color != null
                            ? ColorFilter.mode(
                                color!,
                                BlendMode.srcIn,
                              )
                            : null,
                      )
                    : CustomImageNetwork(
                        imageUrl: iconUrl!,
                        height: size,
                        width: size,
                        boxFit: BoxFit.scaleDown,
                      ),
          ),
        ),
      ),
    );
  }
}
