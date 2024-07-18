import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hostaraguaia/src/home/data/repositories/favorites_repository.dart';
import 'package:hostaraguaia/src/home/data/repositories/search_movies_repository.dart';
import 'package:hostaraguaia/src/home/ui/components/movies_grid_view.dart';
import '../data/datasources/watchmode_datasource.dart';
import '../data/services/hive_database_service.dart';
import 'blocs/favorite_bloc.dart';
import 'blocs/search_bloc.dart';
import 'components/favorites_session.dart';
import 'components/search_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SearchBloc>(
          create: (BuildContext context) => SearchBloc(
            SearchMoviesRepository(
              dataSource: WatchModeDataSourceImpl(Dio()),
            ),
          ),
        ),
        BlocProvider<FavoriteBloc>(
          create: (BuildContext context) => FavoriteBloc(
            FavoritesRepository(
              service: HiveDatabaseService(),
            ),
          ),
        ),
      ],
      child: const _HomeBody(),
    );
  }
}

class _HomeBody extends StatefulWidget {
  const _HomeBody({super.key});

  @override
  State<_HomeBody> createState() => __HomeBodyState();
}

class __HomeBodyState extends State<_HomeBody> {
  @override
  void initState() {
    context.read<FavoriteBloc>().add(ListFavoritesEvent());
    context.read<SearchBloc>().add('');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filmes'),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 4.0),
                child: SearchBarComponent(),
              ),
              const FavoritesSessionComponent(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              const MoviesSessionComponent(),
            ],
          ),
        ),
      ),
    );
  }
}
