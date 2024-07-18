import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hostaraguaia/src/home/data/services/hive_database_service.dart';
import 'src/home/ui/home_page.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(HiveDatabaseService.boxName);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hostaraguaia',
      darkTheme: ThemeData.dark(useMaterial3: true),
      theme: ThemeData.light(useMaterial3: true),
      home: const HomePage(),
    );
  }
}
