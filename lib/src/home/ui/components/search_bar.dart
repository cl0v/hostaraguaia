import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: textController,
            decoration: const InputDecoration(
              labelText: 'Pesquise por um titulo',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
      ],
    );
  }
}
