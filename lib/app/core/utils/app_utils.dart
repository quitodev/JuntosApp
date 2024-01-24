part of 'utils.dart';

class AppUtils {
  static OverlayEntry? entry;

  static void showOverlay(BuildContext context, Widget content) {
    final overlay = Overlay.of(context);
    entry = OverlayEntry(
      builder: (_) => content,
    );
    overlay.insert(entry!);
  }

  static void hideOverlay() {
    entry?.remove();
    entry = null;
  }

  static void showSnackbar(BuildContext context, String text) {
    final theme = Theme.of(context);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: CustomText(
          text: text,
          color: theme.colorScheme.onPrimary,
          maxLines: 5,
        ),
      ),
    );
  }

  static Future<bool> userHasInternet() async {
    return getIt<Connectivity>().checkConnectivity().then(
      (value) {
        switch (value) {
          case ConnectivityResult.mobile:
            return true;
          case ConnectivityResult.wifi:
            return true;
          case ConnectivityResult.ethernet:
            return true;
          case ConnectivityResult.vpn:
            return true;
          // ignore: no_default_cases
          default:
            return false;
        }
      },
      onError: (error) => throw Exception(error),
    );
  }

  static Future<void> openUrl(String url) async {
    if (!await launchUrl(
      Uri.parse(url),
    )) {
      log('Could not launch $url');
    }
  }

  static Future<void> shareApp() async {
    await Share.shareUri(
      Uri.parse(
        Configs.configUrlApp,
      ),
    ).then(
      (_) {},
      onError: (error) {
        log('Share url error: $error');
      },
    );
  }

  static Future<void> shareContent(Widget content) async {
    await ScreenshotController()
        .captureFromWidget(
      content,
      delay: const Duration(milliseconds: 10),
    )
        .then(
      (image) async {
        final directory = await getApplicationDocumentsDirectory();
        final imagePath = await File('${directory.path}/image.jpg').create();
        await imagePath.writeAsBytes(image);
        await Share.shareXFiles([
          XFile('${directory.path}/image.jpg'),
        ]);
      },
      onError: (error) {
        log('Share content error: $error');
      },
    );
  }

  static Future<File?> pickAvatar() async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null) {
      return File(result.files.single.path!);
    }
    return null;
  }
}
