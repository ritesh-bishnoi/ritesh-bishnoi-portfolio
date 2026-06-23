import 'package:flutter/material.dart';

import '../../../contact/presentation/widgets/contact_section.dart';
import '../../../projects/presentation/widgets/projects_section.dart';
import 'widgets/index.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeroPlaceholder(),
            AboutPlaceholder(),
            ProjectsSection(),
            ContactSection(),
          ],
        ),
      ),
    );
  }
}
