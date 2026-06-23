import 'package:flutter/material.dart';

class HeroPlaceholder extends StatelessWidget {
  const HeroPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      alignment: Alignment.center,
      child: Text(
        'Hero Section',
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}