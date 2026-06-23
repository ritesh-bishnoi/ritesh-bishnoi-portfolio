import 'package:flutter/material.dart';

class AboutPlaceholder extends StatelessWidget {
  const AboutPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      alignment: Alignment.center,
      child: Text(
        'About Section',
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}