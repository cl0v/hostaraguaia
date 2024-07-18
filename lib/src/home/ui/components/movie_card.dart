import 'package:flutter/material.dart';

class MovieCardComponent extends StatelessWidget {
  const MovieCardComponent({
    super.key,
    required this.url,
  });
  final String url;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        children: [
          Image.network(
            url,
          ),
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () {},
              color: Colors.red,
              icon: const Icon(
                Icons.favorite,
              ),
            ),
          )
        ],
      ),
    );
  }
}
