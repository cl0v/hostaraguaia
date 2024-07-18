import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hostaraguaia/src/details/data/services/hive_database_service.dart';
import 'src/favorites/data/repositories/favorites_repository.dart';
import 'src/favorites/ui/blocs/favorite_bloc.dart';
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
    return BlocProvider<FavoriteBloc>(
      create: (BuildContext context) => FavoriteBloc(
        FavoritesRepository(
          service: const HiveDatabaseService(),
        ),
      ),
      child: MaterialApp(
        title: 'Hostaraguaia',
        darkTheme: ThemeData.dark(useMaterial3: true),
        theme: ThemeData.light(useMaterial3: true),
        home: const HomePage(),
      ),
    );
  }
}
