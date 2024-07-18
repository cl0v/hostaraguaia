import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hostaraguaia/src/home/domain/repositories/favorites_repository.dart';
import '../../domain/entities/movie_card_entity.dart';

sealed class FavoriteMovieEvent {}

class RemoveFromFavoritesEvent extends FavoriteMovieEvent {
  final int id;

  RemoveFromFavoritesEvent(this.id);
}

class AddToFavoritesEvent extends FavoriteMovieEvent {
  final MovieCardEntity movie;

  AddToFavoritesEvent(this.movie);
}

class ListFavoritesEvent extends FavoriteMovieEvent {}

class FavoriteBloc extends Bloc<FavoriteMovieEvent, List<MovieCardEntity>> {
  IFavoritesRepository repository;

  FavoriteBloc(this.repository) : super([]) {
    on<ListFavoritesEvent>((event, emit) async {
      final favorites = await repository.getFavorites();
      emit(favorites);
    });
    on<AddToFavoritesEvent>((event, emit) async {
      await repository.addFavorite(event.movie);
      add(ListFavoritesEvent());
    });
    on<RemoveFromFavoritesEvent>((event, emit) async {
      await repository.deleteFavorite(event.id);
      add(ListFavoritesEvent());
    });
  }
}
