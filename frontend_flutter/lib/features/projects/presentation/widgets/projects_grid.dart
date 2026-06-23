import 'package:flutter/material.dart';
import 'package:frontend_flutter/core/responsive/responsive.dart';

import 'project_card.dart';

class ProjectsGrid extends StatelessWidget {
  final List projects;

  const ProjectsGrid({super.key, required this.projects});

  @override
  Widget build(BuildContext context) {
    final screen = Responsive.of(context);
    
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: projects.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: screen.gridColumns,
        crossAxisSpacing: 24,
        mainAxisSpacing: 24,
        childAspectRatio: 0.78,
      ),
      itemBuilder: (context, index) {
        return ProjectCard(project: projects[index], onTap: (){});
      },
    );
  }
}
