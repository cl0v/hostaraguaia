import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/search_bloc.dart';

class SearchBarComponent extends StatefulWidget {
  const SearchBarComponent({super.key});

  @override
  State<SearchBarComponent> createState() => _SearchBarComponentState();
}

class _SearchBarComponentState extends State<SearchBarComponent> {
  final textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  void onSubmitted([_]) => context.read<SearchBloc>().add(textController.text);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      onSubmitted: onSubmitted,
      decoration: InputDecoration(
        labelText: 'Pesquise por um titulo',
        border: const OutlineInputBorder(),
        suffixIcon: IconButton(
          onPressed: onSubmitted,
          icon: const Icon(Icons.search),
        ),
      ),
    );
  }
}
