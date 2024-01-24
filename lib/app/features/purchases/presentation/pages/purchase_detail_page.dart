part of 'pages.dart';

class PurchaseDetailPage extends StatelessWidget {
  const PurchaseDetailPage({
    required this.purchase,
    super.key,
  });

  final Purchase purchase;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: theme.colorScheme.background,
      appBar: CustomAppBar(
        title: l10n.purchaseDetail,
      ),
      body: _PurchaseDetailContent(
        purchase: purchase,
      ),
    );
  }
}

class _PurchaseDetailContent extends StatelessWidget {
  const _PurchaseDetailContent({
    required this.purchase,
  });

  final Purchase purchase;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          PurchasePayment(
            purchase: purchase,
          ),
          PurchaseDetail(
            purchase: purchase,
          ),
          const SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}
