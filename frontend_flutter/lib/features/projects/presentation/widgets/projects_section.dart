import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend_flutter/core/widgets/app_empty_view.dart';
import 'package:frontend_flutter/core/widgets/app_error_view.dart';
import 'package:frontend_flutter/features/projects/domain/entities/project_entity.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../bloc/bloc/project_bloc.dart';
import 'projects_grid.dart';

class ProjectsSection extends StatefulWidget {
  const ProjectsSection({super.key});

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProjectBloc>().add(FetchProjects());
    });
  }

  final fakeProject = Project(
    id: '0',
    title: 'Loading Project',
    description: 'Loading project description placeholder',
    techStack: ['Flutter', 'Bloc', 'MongoDB'],
    githubUrl: '',
    liveUrl: '',
    imageUrl: '',
  );

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectBloc, ProjectState>(
      builder: (context, state) {
        if (state is ProjectLoading) {
          return Skeletonizer(
            child: ProjectsGrid(projects: List.generate(6, (_) => fakeProject)),
          );
        }

        if (state is ProjectError) {
          return AppErrorView(
            message: state.message,
            onRetry: () {
              context.read<ProjectBloc>().add(FetchProjects());
            },
          );
        }

        if (state is ProjectLoaded) {
          if (state.projects.isEmpty) {
            return const AppEmptyView(
              title: 'No projects available',
              subtitle: 'Projects will appear here once added.',
            );
          }
          return ProjectsGrid(projects: state.projects);
        }

        return const SizedBox.shrink();
      },
    );
  }
}
