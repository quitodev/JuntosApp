part of 'widgets.dart';

class CustomRadioGroup extends StatelessWidget {
  const CustomRadioGroup({
    required this.text,
    required this.items,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.initialValue,
    this.onChanged,
    this.validator,
    super.key,
  });

  final String text;
  final List<String> items;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final String? initialValue;
  final Function(String?)? onChanged;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return FormBuilderRadioGroup<String>(
      name: text,
      focusColor: theme.colorScheme.onPrimary,
      wrapAlignment: WrapAlignment.spaceBetween,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        label: CustomText(
          text: text,
          fontSize: fontSize ?? 16.spMax,
          fontWeight: fontWeight,
          color: color ?? theme.colorScheme.primary,
        ),
      ),
      initialValue: initialValue,
      options: items
          .map(
            (item) => FormBuilderFieldOption<String>(
              value: item,
              child: CustomText(
                text: item,
                fontSize: fontSize ?? 16.spMax,
                fontWeight: fontWeight,
                color: color ?? theme.colorScheme.primary,
              ),
            ),
          )
          .toList(),
      validator: validator,
      onChanged: onChanged,
    );
  }
}
