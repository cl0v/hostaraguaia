import 'package:flutter/material.dart';

class CustomGridViewComponent extends StatefulWidget {
  const CustomGridViewComponent({super.key,});

  @override
  State<CustomGridViewComponent> createState() => _CustomGridViewComponentState();
}

class _CustomGridViewComponentState extends State<CustomGridViewComponent> {
  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 200 / 360,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      children: [],
    );
  }
}