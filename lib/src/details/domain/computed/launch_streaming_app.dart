import 'package:url_launcher/url_launcher.dart';

launchStreamingApp(String u) async {
  final url = Uri.parse(u);
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}
