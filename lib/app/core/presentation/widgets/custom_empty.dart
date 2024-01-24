part of 'widgets.dart';

class CustomEmpty extends StatelessWidget {
  const CustomEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Center(
      child: CustomText(
        text: l10n.noResultsFound,
        fontSize: 16.spMax,
      ),
    );
  }
}
