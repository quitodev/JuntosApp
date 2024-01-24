part of 'widgets.dart';

class CustomContinueButton extends StatelessWidget {
  const CustomContinueButton({
    required this.onTap,
    this.text,
    super.key,
  });

  final Function() onTap;
  final String? text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (text != null) {
      return CustomButton(
        height: 64,
        width: 1.sw - 100,
        text: text,
        textColor: theme.colorScheme.primary,
        backgroundColor: AppColors.titleAppBar,
        radius: 0,
        borderWidth: 0,
        blurRadius: 100,
        onTap: onTap,
      );
    }
    return CustomButton(
      height: 64,
      width: 64,
      icon: AppSvg.arrowNext,
      iconSize: 32,
      iconColor: theme.colorScheme.onPrimary,
      radius: 64,
      onTap: onTap,
    );
  }
}
