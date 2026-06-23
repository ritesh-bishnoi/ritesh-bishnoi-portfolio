import 'package:flutter/material.dart';
import 'package:frontend_flutter/core/responsive/responsive.dart';

import '../widgets/projects_section.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screen = Responsive.of(context);
    
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(screen.pagePadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Projects',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium,
            ),

            const SizedBox(height: 32),

            const ProjectsSection(),
          ],
        ),
      ),
    );
  }
}

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(title: const Text("Projects")),
  //     body: const ProjectsSection(),
  //   );
  // }
