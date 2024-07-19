import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hostaraguaia/src/favorites/data/services/hive_database_service.dart';
import 'src/app.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(HiveDatabaseService.boxName);

  runApp(const MainApp());
}
