import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hostaraguaia/src/favorites/ui/blocs/favorite_bloc.dart';
import 'package:hostaraguaia/src/utils/computed/sizer.dart';

import '../../home/domain/entities/movie_card_entity.dart';
import '../data/datasources/watchmode_datasource.dart';
import '../data/repositories/movie_details_repository.dart';
import '../domain/entities/movie_details_entity.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({
    super.key,
    required this.movie,
  });
  final MovieCardEntity movie;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  bool isFavorite = false;

  @override
  void initState() {
    isFavorite = context
        .read<FavoriteBloc>()
        .state
        .map<int>((e) => e.id)
        .toList()
        .contains(widget.movie.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.movie.title),
        actions: [
          IconButton(
            onPressed: () {
              if (!isFavorite) {
                context
                    .read<FavoriteBloc>()
                    .add(AddToFavoritesEvent(widget.movie));
                setState(() {
                  isFavorite = true;
                });
              } else {
                context
                    .read<FavoriteBloc>()
                    .add(RemoveFromFavoritesEvent(widget.movie.id));
                setState(() {
                  isFavorite = false;
                });
              }
            },
            color: isFavorite ? Colors.red : Colors.grey,
            icon: const Icon(
              Icons.favorite,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: FutureBuilder<MovieDetailsEntity>(
          future: MovieDetailsRepository(
                  dataSource: WatchmodeDatasourceImpl(client: Dio()))
              .fetchMovieDetails(widget.movie.id),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text(
                  'Ocorreu um erro, tente novamente mais tarde!',
                ),
              );
            } else if (snapshot.hasData) {
              final entity = snapshot.data!;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    snapshot.data!.imageUrl,
                    width: SizeUtils.width(context, 100),
                    height: SizeUtils.height(context, 30),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: SizedBox(
                      height: SizeUtils.height(context, 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            entity.year.toString(),
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                              Text(
                                entity.rating.toString(),
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(entity.overview),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Assista em:',
                      style: Theme.of(context).textTheme.headlineSmall,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Wrap(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisSize: MainAxisSize.min,
                    children: entity.streamingApps
                        .map((e) => TextButton(
                              onPressed: () {
                                print(e.url);
                              },
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.pink,
                              ),
                              child: Text('Assista em ${e.name}'),
                            ))
                        .toList(),
                  )
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
