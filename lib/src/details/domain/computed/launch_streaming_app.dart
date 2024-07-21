import 'package:url_launcher/url_launcher.dart';

launchStreamingApp(String url) async {
  final _url = Uri.parse(url);
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}
