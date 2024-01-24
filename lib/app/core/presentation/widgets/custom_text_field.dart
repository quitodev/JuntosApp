part of 'widgets.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.title,
    this.initialValue,
    this.hint,
    this.icon,
    this.iconColor,
    this.iconSize,
    this.fontSize,
    this.letterSpacing,
    this.maxLength,
    this.fontWeight,
    this.textAlign,
    this.inputType,
    this.obscureText,
    this.enabled,
    this.radius,
    this.validators,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.onIconTap,
    super.key,
  });

  final String title;
  final String? initialValue;
  final String? hint;
  final String? icon;
  final Color? iconColor;
  final double? iconSize;
  final double? fontSize;
  final double? letterSpacing;
  final int? maxLength;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final TextInputType? inputType;
  final bool? obscureText;
  final bool? enabled;
  final double? radius;
  final List<String? Function(String?)>? validators;
  final Function(String?)? onChanged;
  final Function(String?)? onSubmitted;
  final Function()? onTap;
  final Function()? onIconTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      height: 80,
      child: FormBuilderTextField(
        name: title,
        initialValue: initialValue,
        enabled: enabled ?? true,
        onChanged: onChanged,
        onTap: onTap,
        onSubmitted: onSubmitted,
        keyboardType: inputType ?? TextInputType.text,
        obscureText: obscureText ?? false,
        autocorrect: false,
        decoration: InputDecoration(
          isDense: true,
          suffixIcon: icon != null
              ? CustomIcon(
                  icon: icon,
                  color: iconColor ?? theme.colorScheme.onSurface,
                  size: iconSize ?? 32,
                  onTap: onIconTap,
                )
              : null,
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.itemDrawerDivider,
              width: 2,
            ),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.itemDrawerDivider,
              width: 2,
            ),
          ),
          border: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          labelText: title,
          labelStyle: theme.textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 14.spMax,
            color: theme.colorScheme.onSurface,
          ),
        ),
        style: theme.textTheme.bodyMedium!.copyWith(
          fontWeight: fontWeight ?? FontWeight.bold,
          fontSize: fontSize ?? 16.spMax,
          color: theme.colorScheme.onBackground,
          letterSpacing: letterSpacing,
        ),
        textAlign: textAlign ?? TextAlign.start,
        maxLength: maxLength,
        validator: FormBuilderValidators.compose(validators ?? []),
      ),
    );
  }
}
