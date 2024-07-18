import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hostaraguaia/src/home/data/repositories/favorites_repository.dart';
import 'package:hostaraguaia/src/home/data/repositories/search_movies_repository.dart';
import 'package:hostaraguaia/src/home/ui/components/custom_grid_view.dart';

import '../data/datasources/watchmode_datasource.dart';
import '../data/services/hive_database_service.dart';
import '../domain/entities/movie_card_entity.dart';
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
      child: _HomeBody(),
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
                ExpansionTile(
                  title: const Text('Meus Favoritos'),
                  backgroundColor: Colors.red[50],
                  children: [
                    BlocBuilder<FavoriteBloc, List<MovieCardEntity>>(
                        builder: (context, state) {
                      if (state.isEmpty) {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                          child: const Center(
                            child: Text('Nenhum item adicionado aos Favoritos'),
                          ),
                        );
                      }
                      return SizedBox(
                        height: MediaQuery.of(context).size.height * 0.2,
                        child: FavoritesSessionComponent(
                          movies: state,
                        ),
                      );
                    }),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                BlocBuilder<SearchBloc, Future<List<MovieCardEntity>?>>(
                  builder: (context, state) {
                    return FutureBuilder(
                      future: state,
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Center(
                            child: Text(snapshot.error.toString()),
                          );
                        }
                        if (snapshot.hasData &&
                            snapshot.data != null &&
                            snapshot.data!.isNotEmpty) {
                          return CustomGridViewComponent(
                            movies: snapshot.data!,
                          );
                        }
                        if (snapshot.hasData &&
                            snapshot.data != null &&
                            snapshot.data!.isEmpty) {
                          return const Center(
                            child: Text('Nenhum filme encontrado'),
                          );
                        }
                        return Center(
                          child: Platform.isIOS
                              ? const CupertinoActivityIndicator()
                              : const CircularProgressIndicator(),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
