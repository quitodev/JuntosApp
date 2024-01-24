part of 'widgets.dart';

class CustomError extends StatelessWidget {
  const CustomError({
    this.text,
    super.key,
  });

  final String? text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomText(
        text: text ?? Errors.errorNetwork,
        fontSize: 16.spMax,
      ),
    );
  }
}
