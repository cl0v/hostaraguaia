import 'package:flutter_dotenv/flutter_dotenv.dart';

String? get watchmode_api_key => dotenv.env['WATCH_MODE_API_KEY'];
