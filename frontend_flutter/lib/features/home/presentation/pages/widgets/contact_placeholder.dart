import 'package:flutter/material.dart';

class ContactPlaceholder extends StatelessWidget {
  const ContactPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      alignment: Alignment.center,
      child: Text(
        'Contact Section',
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}