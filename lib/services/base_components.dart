import 'package:flutter_share/flutter_share.dart';

Future<void> share(String title, String link) async {
  await FlutterShare.share(
      title: title,
      text: 'Example share text',
      linkUrl: link,
      chooserTitle: 'Example Chooser Title');
}
