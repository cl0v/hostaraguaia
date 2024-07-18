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
      child: Image.network(url),
    );
  }
}
