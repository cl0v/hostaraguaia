import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hostaraguaia/src/home/ui/blocs/search_bloc.dart';
import 'package:hostaraguaia/src/utils/computed/grid_cards_count.dart';

import '../../home/domain/entities/movie_card_entity.dart';
import 'movie_card.dart';

class MoviesGridViewComponent extends StatefulWidget {
  const MoviesGridViewComponent({
    super.key,
    required this.movies,
  });

  final List<MovieCardEntity> movies;

  @override
  State<MoviesGridViewComponent> createState() =>
      _MoviesGridViewComponentState();
}

class _MoviesGridViewComponentState extends State<MoviesGridViewComponent> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      bool isWide = constraints.maxWidth > 756;
      return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: gridCardsCount(constraints.maxWidth, isWide),
          childAspectRatio: 185 / 278,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
        ),
        itemBuilder: (context, index) => MovieCardComponent(
          movie: widget.movies[index],
        ),
        itemCount: widget.movies.length,
      );
    });
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) context.read<SearchBloc>().add('');
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
