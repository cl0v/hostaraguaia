import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hostaraguaia/src/favorites/ui/blocs/favorite_bloc.dart';

bool isFavorite(BuildContext context, int id) {
  return context
      .read<FavoriteBloc>()
      .state
      .map<int>((e) => e.id)
      .toList()
      .contains(id);
}
