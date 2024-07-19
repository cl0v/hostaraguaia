import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hostaraguaia/src/favorites/data/repositories/favorites_repository.dart';
import 'package:hostaraguaia/src/favorites/data/services/hive_database_service.dart';
import 'package:hostaraguaia/src/favorites/ui/blocs/favorite_bloc.dart';

import 'home/ui/home_page.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FavoriteBloc>(
      create: (BuildContext context) => FavoriteBloc(
        FavoritesRepository(
          service: const HiveDatabaseService(),
        ),
      ),
      child:MaterialApp(
          title: 'Hostaraguaia',
          darkTheme: ThemeData.dark(useMaterial3: true),
          theme: ThemeData.light(useMaterial3: true),
          home: const HomePage(),
        ),
    );
  }
}
