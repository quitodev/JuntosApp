part of 'widgets.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({
    required this.text,
    required this.onTap,
    super.key,
  });

  final String text;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: 1.sw,
      decoration: BoxDecoration(
        color: theme.colorScheme.onPrimary,
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.shadow,
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(1, 1),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 50,
          vertical: 8,
        ),
        child: CustomContinueButton(
          text: text,
          onTap: onTap,
        ),
      ),
    );
  }
}
